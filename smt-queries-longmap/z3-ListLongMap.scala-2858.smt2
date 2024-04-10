; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41180 () Bool)

(assert start!41180)

(declare-fun b_free!11049 () Bool)

(declare-fun b_next!11049 () Bool)

(assert (=> start!41180 (= b_free!11049 (not b_next!11049))))

(declare-fun tp!38983 () Bool)

(declare-fun b_and!19337 () Bool)

(assert (=> start!41180 (= tp!38983 b_and!19337)))

(declare-fun b!460309 () Bool)

(declare-datatypes ((Unit!13396 0))(
  ( (Unit!13397) )
))
(declare-fun e!268560 () Unit!13396)

(declare-fun Unit!13398 () Unit!13396)

(assert (=> b!460309 (= e!268560 Unit!13398)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!208419 () Unit!13396)

(declare-datatypes ((array!28575 0))(
  ( (array!28576 (arr!13728 (Array (_ BitVec 32) (_ BitVec 64))) (size!14080 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28575)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13396)

(assert (=> b!460309 (= lt!208419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460309 false))

(declare-fun b!460310 () Bool)

(declare-fun e!268567 () Bool)

(declare-fun tp_is_empty!12387 () Bool)

(assert (=> b!460310 (= e!268567 tp_is_empty!12387)))

(declare-fun mapIsEmpty!20230 () Bool)

(declare-fun mapRes!20230 () Bool)

(assert (=> mapIsEmpty!20230 mapRes!20230))

(declare-fun b!460311 () Bool)

(declare-fun res!275194 () Bool)

(declare-fun e!268568 () Bool)

(assert (=> b!460311 (=> (not res!275194) (not e!268568))))

(declare-fun arrayContainsKey!0 (array!28575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460311 (= res!275194 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!460312 () Bool)

(declare-fun res!275200 () Bool)

(assert (=> b!460312 (=> (not res!275200) (not e!268568))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460312 (= res!275200 (validMask!0 mask!1025))))

(declare-fun b!460313 () Bool)

(declare-fun e!268564 () Bool)

(assert (=> b!460313 (= e!268564 tp_is_empty!12387)))

(declare-fun b!460314 () Bool)

(declare-fun Unit!13399 () Unit!13396)

(assert (=> b!460314 (= e!268560 Unit!13399)))

(declare-fun b!460315 () Bool)

(declare-fun e!268566 () Bool)

(declare-fun e!268563 () Bool)

(assert (=> b!460315 (= e!268566 (not e!268563))))

(declare-fun res!275198 () Bool)

(assert (=> b!460315 (=> res!275198 e!268563)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460315 (= res!275198 (not (validKeyInArray!0 (select (arr!13728 _keys!709) from!863))))))

(declare-datatypes ((V!17621 0))(
  ( (V!17622 (val!6238 Int)) )
))
(declare-datatypes ((tuple2!8228 0))(
  ( (tuple2!8229 (_1!4125 (_ BitVec 64)) (_2!4125 V!17621)) )
))
(declare-datatypes ((List!8299 0))(
  ( (Nil!8296) (Cons!8295 (h!9151 tuple2!8228) (t!14227 List!8299)) )
))
(declare-datatypes ((ListLongMap!7141 0))(
  ( (ListLongMap!7142 (toList!3586 List!8299)) )
))
(declare-fun lt!208415 () ListLongMap!7141)

(declare-fun lt!208407 () ListLongMap!7141)

(assert (=> b!460315 (= lt!208415 lt!208407)))

(declare-fun lt!208409 () ListLongMap!7141)

(declare-fun lt!208410 () tuple2!8228)

(declare-fun +!1622 (ListLongMap!7141 tuple2!8228) ListLongMap!7141)

(assert (=> b!460315 (= lt!208407 (+!1622 lt!208409 lt!208410))))

(declare-fun minValue!515 () V!17621)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208420 () array!28575)

(declare-datatypes ((ValueCell!5850 0))(
  ( (ValueCellFull!5850 (v!8516 V!17621)) (EmptyCell!5850) )
))
(declare-datatypes ((array!28577 0))(
  ( (array!28578 (arr!13729 (Array (_ BitVec 32) ValueCell!5850)) (size!14081 (_ BitVec 32))) )
))
(declare-fun lt!208421 () array!28577)

(declare-fun zeroValue!515 () V!17621)

(declare-fun getCurrentListMapNoExtraKeys!1766 (array!28575 array!28577 (_ BitVec 32) (_ BitVec 32) V!17621 V!17621 (_ BitVec 32) Int) ListLongMap!7141)

(assert (=> b!460315 (= lt!208415 (getCurrentListMapNoExtraKeys!1766 lt!208420 lt!208421 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17621)

(assert (=> b!460315 (= lt!208410 (tuple2!8229 k0!794 v!412))))

(declare-fun _values!549 () array!28577)

(assert (=> b!460315 (= lt!208409 (getCurrentListMapNoExtraKeys!1766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208414 () Unit!13396)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!778 (array!28575 array!28577 (_ BitVec 32) (_ BitVec 32) V!17621 V!17621 (_ BitVec 32) (_ BitVec 64) V!17621 (_ BitVec 32) Int) Unit!13396)

(assert (=> b!460315 (= lt!208414 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!778 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460316 () Bool)

(declare-fun res!275205 () Bool)

(declare-fun e!268562 () Bool)

(assert (=> b!460316 (=> (not res!275205) (not e!268562))))

(declare-datatypes ((List!8300 0))(
  ( (Nil!8297) (Cons!8296 (h!9152 (_ BitVec 64)) (t!14228 List!8300)) )
))
(declare-fun arrayNoDuplicates!0 (array!28575 (_ BitVec 32) List!8300) Bool)

(assert (=> b!460316 (= res!275205 (arrayNoDuplicates!0 lt!208420 #b00000000000000000000000000000000 Nil!8297))))

(declare-fun mapNonEmpty!20230 () Bool)

(declare-fun tp!38982 () Bool)

(assert (=> mapNonEmpty!20230 (= mapRes!20230 (and tp!38982 e!268567))))

(declare-fun mapRest!20230 () (Array (_ BitVec 32) ValueCell!5850))

(declare-fun mapValue!20230 () ValueCell!5850)

(declare-fun mapKey!20230 () (_ BitVec 32))

(assert (=> mapNonEmpty!20230 (= (arr!13729 _values!549) (store mapRest!20230 mapKey!20230 mapValue!20230))))

(declare-fun b!460317 () Bool)

(assert (=> b!460317 (= e!268562 e!268566)))

(declare-fun res!275192 () Bool)

(assert (=> b!460317 (=> (not res!275192) (not e!268566))))

(assert (=> b!460317 (= res!275192 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208412 () ListLongMap!7141)

(assert (=> b!460317 (= lt!208412 (getCurrentListMapNoExtraKeys!1766 lt!208420 lt!208421 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460317 (= lt!208421 (array!28578 (store (arr!13729 _values!549) i!563 (ValueCellFull!5850 v!412)) (size!14081 _values!549)))))

(declare-fun lt!208411 () ListLongMap!7141)

(assert (=> b!460317 (= lt!208411 (getCurrentListMapNoExtraKeys!1766 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!275202 () Bool)

(assert (=> start!41180 (=> (not res!275202) (not e!268568))))

(assert (=> start!41180 (= res!275202 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14080 _keys!709))))))

(assert (=> start!41180 e!268568))

(assert (=> start!41180 tp_is_empty!12387))

(assert (=> start!41180 tp!38983))

(assert (=> start!41180 true))

(declare-fun e!268569 () Bool)

(declare-fun array_inv!9928 (array!28577) Bool)

(assert (=> start!41180 (and (array_inv!9928 _values!549) e!268569)))

(declare-fun array_inv!9929 (array!28575) Bool)

(assert (=> start!41180 (array_inv!9929 _keys!709)))

(declare-fun b!460318 () Bool)

(assert (=> b!460318 (= e!268569 (and e!268564 mapRes!20230))))

(declare-fun condMapEmpty!20230 () Bool)

(declare-fun mapDefault!20230 () ValueCell!5850)

(assert (=> b!460318 (= condMapEmpty!20230 (= (arr!13729 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5850)) mapDefault!20230)))))

(declare-fun b!460319 () Bool)

(declare-fun res!275201 () Bool)

(assert (=> b!460319 (=> (not res!275201) (not e!268568))))

(assert (=> b!460319 (= res!275201 (and (= (size!14081 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14080 _keys!709) (size!14081 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460320 () Bool)

(declare-fun res!275203 () Bool)

(assert (=> b!460320 (=> (not res!275203) (not e!268568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28575 (_ BitVec 32)) Bool)

(assert (=> b!460320 (= res!275203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460321 () Bool)

(declare-fun res!275197 () Bool)

(assert (=> b!460321 (=> (not res!275197) (not e!268562))))

(assert (=> b!460321 (= res!275197 (bvsle from!863 i!563))))

(declare-fun b!460322 () Bool)

(declare-fun e!268561 () Bool)

(assert (=> b!460322 (= e!268563 e!268561)))

(declare-fun res!275199 () Bool)

(assert (=> b!460322 (=> res!275199 e!268561)))

(assert (=> b!460322 (= res!275199 (= k0!794 (select (arr!13728 _keys!709) from!863)))))

(assert (=> b!460322 (not (= (select (arr!13728 _keys!709) from!863) k0!794))))

(declare-fun lt!208416 () Unit!13396)

(assert (=> b!460322 (= lt!208416 e!268560)))

(declare-fun c!56522 () Bool)

(assert (=> b!460322 (= c!56522 (= (select (arr!13728 _keys!709) from!863) k0!794))))

(declare-fun lt!208418 () ListLongMap!7141)

(assert (=> b!460322 (= lt!208412 lt!208418)))

(declare-fun lt!208413 () tuple2!8228)

(assert (=> b!460322 (= lt!208418 (+!1622 lt!208407 lt!208413))))

(declare-fun lt!208408 () V!17621)

(assert (=> b!460322 (= lt!208413 (tuple2!8229 (select (arr!13728 _keys!709) from!863) lt!208408))))

(declare-fun get!6776 (ValueCell!5850 V!17621) V!17621)

(declare-fun dynLambda!906 (Int (_ BitVec 64)) V!17621)

(assert (=> b!460322 (= lt!208408 (get!6776 (select (arr!13729 _values!549) from!863) (dynLambda!906 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460323 () Bool)

(declare-fun res!275204 () Bool)

(assert (=> b!460323 (=> (not res!275204) (not e!268568))))

(assert (=> b!460323 (= res!275204 (or (= (select (arr!13728 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13728 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460324 () Bool)

(declare-fun res!275206 () Bool)

(assert (=> b!460324 (=> (not res!275206) (not e!268568))))

(assert (=> b!460324 (= res!275206 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14080 _keys!709))))))

(declare-fun b!460325 () Bool)

(assert (=> b!460325 (= e!268561 true)))

(assert (=> b!460325 (= lt!208418 (+!1622 (+!1622 lt!208409 lt!208413) lt!208410))))

(declare-fun lt!208417 () Unit!13396)

(declare-fun addCommutativeForDiffKeys!431 (ListLongMap!7141 (_ BitVec 64) V!17621 (_ BitVec 64) V!17621) Unit!13396)

(assert (=> b!460325 (= lt!208417 (addCommutativeForDiffKeys!431 lt!208409 k0!794 v!412 (select (arr!13728 _keys!709) from!863) lt!208408))))

(declare-fun b!460326 () Bool)

(declare-fun res!275196 () Bool)

(assert (=> b!460326 (=> (not res!275196) (not e!268568))))

(assert (=> b!460326 (= res!275196 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8297))))

(declare-fun b!460327 () Bool)

(declare-fun res!275195 () Bool)

(assert (=> b!460327 (=> (not res!275195) (not e!268568))))

(assert (=> b!460327 (= res!275195 (validKeyInArray!0 k0!794))))

(declare-fun b!460328 () Bool)

(assert (=> b!460328 (= e!268568 e!268562)))

(declare-fun res!275193 () Bool)

(assert (=> b!460328 (=> (not res!275193) (not e!268562))))

(assert (=> b!460328 (= res!275193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208420 mask!1025))))

(assert (=> b!460328 (= lt!208420 (array!28576 (store (arr!13728 _keys!709) i!563 k0!794) (size!14080 _keys!709)))))

(assert (= (and start!41180 res!275202) b!460312))

(assert (= (and b!460312 res!275200) b!460319))

(assert (= (and b!460319 res!275201) b!460320))

(assert (= (and b!460320 res!275203) b!460326))

(assert (= (and b!460326 res!275196) b!460324))

(assert (= (and b!460324 res!275206) b!460327))

(assert (= (and b!460327 res!275195) b!460323))

(assert (= (and b!460323 res!275204) b!460311))

(assert (= (and b!460311 res!275194) b!460328))

(assert (= (and b!460328 res!275193) b!460316))

(assert (= (and b!460316 res!275205) b!460321))

(assert (= (and b!460321 res!275197) b!460317))

(assert (= (and b!460317 res!275192) b!460315))

(assert (= (and b!460315 (not res!275198)) b!460322))

(assert (= (and b!460322 c!56522) b!460309))

(assert (= (and b!460322 (not c!56522)) b!460314))

(assert (= (and b!460322 (not res!275199)) b!460325))

(assert (= (and b!460318 condMapEmpty!20230) mapIsEmpty!20230))

(assert (= (and b!460318 (not condMapEmpty!20230)) mapNonEmpty!20230))

(get-info :version)

(assert (= (and mapNonEmpty!20230 ((_ is ValueCellFull!5850) mapValue!20230)) b!460310))

(assert (= (and b!460318 ((_ is ValueCellFull!5850) mapDefault!20230)) b!460313))

(assert (= start!41180 b!460318))

(declare-fun b_lambda!9883 () Bool)

(assert (=> (not b_lambda!9883) (not b!460322)))

(declare-fun t!14226 () Bool)

(declare-fun tb!3885 () Bool)

(assert (=> (and start!41180 (= defaultEntry!557 defaultEntry!557) t!14226) tb!3885))

(declare-fun result!7315 () Bool)

(assert (=> tb!3885 (= result!7315 tp_is_empty!12387)))

(assert (=> b!460322 t!14226))

(declare-fun b_and!19339 () Bool)

(assert (= b_and!19337 (and (=> t!14226 result!7315) b_and!19339)))

(declare-fun m!443509 () Bool)

(assert (=> b!460312 m!443509))

(declare-fun m!443511 () Bool)

(assert (=> b!460316 m!443511))

(declare-fun m!443513 () Bool)

(assert (=> b!460326 m!443513))

(declare-fun m!443515 () Bool)

(assert (=> b!460317 m!443515))

(declare-fun m!443517 () Bool)

(assert (=> b!460317 m!443517))

(declare-fun m!443519 () Bool)

(assert (=> b!460317 m!443519))

(declare-fun m!443521 () Bool)

(assert (=> b!460327 m!443521))

(declare-fun m!443523 () Bool)

(assert (=> start!41180 m!443523))

(declare-fun m!443525 () Bool)

(assert (=> start!41180 m!443525))

(declare-fun m!443527 () Bool)

(assert (=> mapNonEmpty!20230 m!443527))

(declare-fun m!443529 () Bool)

(assert (=> b!460309 m!443529))

(declare-fun m!443531 () Bool)

(assert (=> b!460315 m!443531))

(declare-fun m!443533 () Bool)

(assert (=> b!460315 m!443533))

(declare-fun m!443535 () Bool)

(assert (=> b!460315 m!443535))

(declare-fun m!443537 () Bool)

(assert (=> b!460315 m!443537))

(assert (=> b!460315 m!443531))

(declare-fun m!443539 () Bool)

(assert (=> b!460315 m!443539))

(declare-fun m!443541 () Bool)

(assert (=> b!460315 m!443541))

(declare-fun m!443543 () Bool)

(assert (=> b!460323 m!443543))

(declare-fun m!443545 () Bool)

(assert (=> b!460311 m!443545))

(assert (=> b!460322 m!443531))

(declare-fun m!443547 () Bool)

(assert (=> b!460322 m!443547))

(declare-fun m!443549 () Bool)

(assert (=> b!460322 m!443549))

(declare-fun m!443551 () Bool)

(assert (=> b!460322 m!443551))

(assert (=> b!460322 m!443551))

(assert (=> b!460322 m!443549))

(declare-fun m!443553 () Bool)

(assert (=> b!460322 m!443553))

(declare-fun m!443555 () Bool)

(assert (=> b!460325 m!443555))

(assert (=> b!460325 m!443555))

(declare-fun m!443557 () Bool)

(assert (=> b!460325 m!443557))

(assert (=> b!460325 m!443531))

(assert (=> b!460325 m!443531))

(declare-fun m!443559 () Bool)

(assert (=> b!460325 m!443559))

(declare-fun m!443561 () Bool)

(assert (=> b!460328 m!443561))

(declare-fun m!443563 () Bool)

(assert (=> b!460328 m!443563))

(declare-fun m!443565 () Bool)

(assert (=> b!460320 m!443565))

(check-sat (not b!460311) (not b_lambda!9883) (not b!460327) (not b!460325) (not b!460316) (not b!460309) tp_is_empty!12387 (not mapNonEmpty!20230) (not b!460326) (not start!41180) (not b_next!11049) (not b!460317) (not b!460312) (not b!460315) (not b!460322) (not b!460328) b_and!19339 (not b!460320))
(check-sat b_and!19339 (not b_next!11049))
