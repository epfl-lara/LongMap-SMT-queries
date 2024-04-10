; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39990 () Bool)

(assert start!39990)

(declare-fun b_free!10257 () Bool)

(declare-fun b_next!10257 () Bool)

(assert (=> start!39990 (= b_free!10257 (not b_next!10257))))

(declare-fun tp!36299 () Bool)

(declare-fun b_and!18173 () Bool)

(assert (=> start!39990 (= tp!36299 b_and!18173)))

(declare-fun b!435168 () Bool)

(declare-fun e!257119 () Bool)

(assert (=> b!435168 (= e!257119 true)))

(declare-datatypes ((V!16317 0))(
  ( (V!16318 (val!5749 Int)) )
))
(declare-datatypes ((tuple2!7612 0))(
  ( (tuple2!7613 (_1!3817 (_ BitVec 64)) (_2!3817 V!16317)) )
))
(declare-datatypes ((List!7614 0))(
  ( (Nil!7611) (Cons!7610 (h!8466 tuple2!7612) (t!13320 List!7614)) )
))
(declare-datatypes ((ListLongMap!6525 0))(
  ( (ListLongMap!6526 (toList!3278 List!7614)) )
))
(declare-fun lt!200294 () ListLongMap!6525)

(declare-fun lt!200288 () ListLongMap!6525)

(declare-fun lt!200296 () tuple2!7612)

(declare-fun lt!200292 () tuple2!7612)

(declare-fun +!1426 (ListLongMap!6525 tuple2!7612) ListLongMap!6525)

(assert (=> b!435168 (= lt!200294 (+!1426 (+!1426 lt!200288 lt!200292) lt!200296))))

(declare-datatypes ((Unit!12917 0))(
  ( (Unit!12918) )
))
(declare-fun lt!200298 () Unit!12917)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!200291 () V!16317)

(declare-fun v!412 () V!16317)

(declare-datatypes ((array!26649 0))(
  ( (array!26650 (arr!12774 (Array (_ BitVec 32) (_ BitVec 64))) (size!13126 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26649)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!410 (ListLongMap!6525 (_ BitVec 64) V!16317 (_ BitVec 64) V!16317) Unit!12917)

(assert (=> b!435168 (= lt!200298 (addCommutativeForDiffKeys!410 lt!200288 k0!794 v!412 (select (arr!12774 _keys!709) from!863) lt!200291))))

(declare-fun b!435169 () Bool)

(declare-fun res!256351 () Bool)

(declare-fun e!257118 () Bool)

(assert (=> b!435169 (=> (not res!256351) (not e!257118))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435169 (= res!256351 (bvsle from!863 i!563))))

(declare-fun b!435170 () Bool)

(declare-fun e!257120 () Unit!12917)

(declare-fun Unit!12919 () Unit!12917)

(assert (=> b!435170 (= e!257120 Unit!12919)))

(declare-fun lt!200290 () Unit!12917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12917)

(assert (=> b!435170 (= lt!200290 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435170 false))

(declare-fun b!435171 () Bool)

(declare-fun e!257116 () Bool)

(declare-fun e!257115 () Bool)

(assert (=> b!435171 (= e!257116 (not e!257115))))

(declare-fun res!256365 () Bool)

(assert (=> b!435171 (=> res!256365 e!257115)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435171 (= res!256365 (not (validKeyInArray!0 (select (arr!12774 _keys!709) from!863))))))

(declare-fun lt!200293 () ListLongMap!6525)

(declare-fun lt!200289 () ListLongMap!6525)

(assert (=> b!435171 (= lt!200293 lt!200289)))

(assert (=> b!435171 (= lt!200289 (+!1426 lt!200288 lt!200296))))

(declare-datatypes ((ValueCell!5361 0))(
  ( (ValueCellFull!5361 (v!7996 V!16317)) (EmptyCell!5361) )
))
(declare-datatypes ((array!26651 0))(
  ( (array!26652 (arr!12775 (Array (_ BitVec 32) ValueCell!5361)) (size!13127 (_ BitVec 32))) )
))
(declare-fun lt!200286 () array!26651)

(declare-fun minValue!515 () V!16317)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200299 () array!26649)

(declare-fun zeroValue!515 () V!16317)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1469 (array!26649 array!26651 (_ BitVec 32) (_ BitVec 32) V!16317 V!16317 (_ BitVec 32) Int) ListLongMap!6525)

(assert (=> b!435171 (= lt!200293 (getCurrentListMapNoExtraKeys!1469 lt!200299 lt!200286 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435171 (= lt!200296 (tuple2!7613 k0!794 v!412))))

(declare-fun _values!549 () array!26651)

(assert (=> b!435171 (= lt!200288 (getCurrentListMapNoExtraKeys!1469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200300 () Unit!12917)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!599 (array!26649 array!26651 (_ BitVec 32) (_ BitVec 32) V!16317 V!16317 (_ BitVec 32) (_ BitVec 64) V!16317 (_ BitVec 32) Int) Unit!12917)

(assert (=> b!435171 (= lt!200300 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!599 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!256362 () Bool)

(declare-fun e!257114 () Bool)

(assert (=> start!39990 (=> (not res!256362) (not e!257114))))

(assert (=> start!39990 (= res!256362 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13126 _keys!709))))))

(assert (=> start!39990 e!257114))

(declare-fun tp_is_empty!11409 () Bool)

(assert (=> start!39990 tp_is_empty!11409))

(assert (=> start!39990 tp!36299))

(assert (=> start!39990 true))

(declare-fun e!257121 () Bool)

(declare-fun array_inv!9286 (array!26651) Bool)

(assert (=> start!39990 (and (array_inv!9286 _values!549) e!257121)))

(declare-fun array_inv!9287 (array!26649) Bool)

(assert (=> start!39990 (array_inv!9287 _keys!709)))

(declare-fun b!435172 () Bool)

(declare-fun Unit!12920 () Unit!12917)

(assert (=> b!435172 (= e!257120 Unit!12920)))

(declare-fun b!435173 () Bool)

(declare-fun e!257113 () Bool)

(assert (=> b!435173 (= e!257113 tp_is_empty!11409)))

(declare-fun b!435174 () Bool)

(declare-fun res!256359 () Bool)

(assert (=> b!435174 (=> (not res!256359) (not e!257114))))

(declare-fun arrayContainsKey!0 (array!26649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435174 (= res!256359 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435175 () Bool)

(declare-fun e!257112 () Bool)

(declare-fun mapRes!18735 () Bool)

(assert (=> b!435175 (= e!257121 (and e!257112 mapRes!18735))))

(declare-fun condMapEmpty!18735 () Bool)

(declare-fun mapDefault!18735 () ValueCell!5361)

(assert (=> b!435175 (= condMapEmpty!18735 (= (arr!12775 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5361)) mapDefault!18735)))))

(declare-fun b!435176 () Bool)

(assert (=> b!435176 (= e!257115 e!257119)))

(declare-fun res!256363 () Bool)

(assert (=> b!435176 (=> res!256363 e!257119)))

(assert (=> b!435176 (= res!256363 (= k0!794 (select (arr!12774 _keys!709) from!863)))))

(assert (=> b!435176 (not (= (select (arr!12774 _keys!709) from!863) k0!794))))

(declare-fun lt!200287 () Unit!12917)

(assert (=> b!435176 (= lt!200287 e!257120)))

(declare-fun c!55721 () Bool)

(assert (=> b!435176 (= c!55721 (= (select (arr!12774 _keys!709) from!863) k0!794))))

(declare-fun lt!200295 () ListLongMap!6525)

(assert (=> b!435176 (= lt!200295 lt!200294)))

(assert (=> b!435176 (= lt!200294 (+!1426 lt!200289 lt!200292))))

(assert (=> b!435176 (= lt!200292 (tuple2!7613 (select (arr!12774 _keys!709) from!863) lt!200291))))

(declare-fun get!6366 (ValueCell!5361 V!16317) V!16317)

(declare-fun dynLambda!833 (Int (_ BitVec 64)) V!16317)

(assert (=> b!435176 (= lt!200291 (get!6366 (select (arr!12775 _values!549) from!863) (dynLambda!833 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435177 () Bool)

(declare-fun res!256356 () Bool)

(assert (=> b!435177 (=> (not res!256356) (not e!257114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26649 (_ BitVec 32)) Bool)

(assert (=> b!435177 (= res!256356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435178 () Bool)

(declare-fun res!256352 () Bool)

(assert (=> b!435178 (=> (not res!256352) (not e!257114))))

(assert (=> b!435178 (= res!256352 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18735 () Bool)

(assert (=> mapIsEmpty!18735 mapRes!18735))

(declare-fun b!435179 () Bool)

(declare-fun res!256357 () Bool)

(assert (=> b!435179 (=> (not res!256357) (not e!257114))))

(assert (=> b!435179 (= res!256357 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13126 _keys!709))))))

(declare-fun b!435180 () Bool)

(assert (=> b!435180 (= e!257112 tp_is_empty!11409)))

(declare-fun b!435181 () Bool)

(declare-fun res!256353 () Bool)

(assert (=> b!435181 (=> (not res!256353) (not e!257114))))

(assert (=> b!435181 (= res!256353 (or (= (select (arr!12774 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12774 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435182 () Bool)

(declare-fun res!256360 () Bool)

(assert (=> b!435182 (=> (not res!256360) (not e!257118))))

(declare-datatypes ((List!7615 0))(
  ( (Nil!7612) (Cons!7611 (h!8467 (_ BitVec 64)) (t!13321 List!7615)) )
))
(declare-fun arrayNoDuplicates!0 (array!26649 (_ BitVec 32) List!7615) Bool)

(assert (=> b!435182 (= res!256360 (arrayNoDuplicates!0 lt!200299 #b00000000000000000000000000000000 Nil!7612))))

(declare-fun b!435183 () Bool)

(declare-fun res!256354 () Bool)

(assert (=> b!435183 (=> (not res!256354) (not e!257114))))

(assert (=> b!435183 (= res!256354 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7612))))

(declare-fun b!435184 () Bool)

(declare-fun res!256364 () Bool)

(assert (=> b!435184 (=> (not res!256364) (not e!257114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435184 (= res!256364 (validMask!0 mask!1025))))

(declare-fun b!435185 () Bool)

(assert (=> b!435185 (= e!257114 e!257118)))

(declare-fun res!256358 () Bool)

(assert (=> b!435185 (=> (not res!256358) (not e!257118))))

(assert (=> b!435185 (= res!256358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200299 mask!1025))))

(assert (=> b!435185 (= lt!200299 (array!26650 (store (arr!12774 _keys!709) i!563 k0!794) (size!13126 _keys!709)))))

(declare-fun b!435186 () Bool)

(assert (=> b!435186 (= e!257118 e!257116)))

(declare-fun res!256355 () Bool)

(assert (=> b!435186 (=> (not res!256355) (not e!257116))))

(assert (=> b!435186 (= res!256355 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435186 (= lt!200295 (getCurrentListMapNoExtraKeys!1469 lt!200299 lt!200286 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435186 (= lt!200286 (array!26652 (store (arr!12775 _values!549) i!563 (ValueCellFull!5361 v!412)) (size!13127 _values!549)))))

(declare-fun lt!200297 () ListLongMap!6525)

(assert (=> b!435186 (= lt!200297 (getCurrentListMapNoExtraKeys!1469 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435187 () Bool)

(declare-fun res!256361 () Bool)

(assert (=> b!435187 (=> (not res!256361) (not e!257114))))

(assert (=> b!435187 (= res!256361 (and (= (size!13127 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13126 _keys!709) (size!13127 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18735 () Bool)

(declare-fun tp!36300 () Bool)

(assert (=> mapNonEmpty!18735 (= mapRes!18735 (and tp!36300 e!257113))))

(declare-fun mapRest!18735 () (Array (_ BitVec 32) ValueCell!5361))

(declare-fun mapKey!18735 () (_ BitVec 32))

(declare-fun mapValue!18735 () ValueCell!5361)

(assert (=> mapNonEmpty!18735 (= (arr!12775 _values!549) (store mapRest!18735 mapKey!18735 mapValue!18735))))

(assert (= (and start!39990 res!256362) b!435184))

(assert (= (and b!435184 res!256364) b!435187))

(assert (= (and b!435187 res!256361) b!435177))

(assert (= (and b!435177 res!256356) b!435183))

(assert (= (and b!435183 res!256354) b!435179))

(assert (= (and b!435179 res!256357) b!435178))

(assert (= (and b!435178 res!256352) b!435181))

(assert (= (and b!435181 res!256353) b!435174))

(assert (= (and b!435174 res!256359) b!435185))

(assert (= (and b!435185 res!256358) b!435182))

(assert (= (and b!435182 res!256360) b!435169))

(assert (= (and b!435169 res!256351) b!435186))

(assert (= (and b!435186 res!256355) b!435171))

(assert (= (and b!435171 (not res!256365)) b!435176))

(assert (= (and b!435176 c!55721) b!435170))

(assert (= (and b!435176 (not c!55721)) b!435172))

(assert (= (and b!435176 (not res!256363)) b!435168))

(assert (= (and b!435175 condMapEmpty!18735) mapIsEmpty!18735))

(assert (= (and b!435175 (not condMapEmpty!18735)) mapNonEmpty!18735))

(get-info :version)

(assert (= (and mapNonEmpty!18735 ((_ is ValueCellFull!5361) mapValue!18735)) b!435173))

(assert (= (and b!435175 ((_ is ValueCellFull!5361) mapDefault!18735)) b!435180))

(assert (= start!39990 b!435175))

(declare-fun b_lambda!9345 () Bool)

(assert (=> (not b_lambda!9345) (not b!435176)))

(declare-fun t!13319 () Bool)

(declare-fun tb!3663 () Bool)

(assert (=> (and start!39990 (= defaultEntry!557 defaultEntry!557) t!13319) tb!3663))

(declare-fun result!6853 () Bool)

(assert (=> tb!3663 (= result!6853 tp_is_empty!11409)))

(assert (=> b!435176 t!13319))

(declare-fun b_and!18175 () Bool)

(assert (= b_and!18173 (and (=> t!13319 result!6853) b_and!18175)))

(declare-fun m!423073 () Bool)

(assert (=> b!435181 m!423073))

(declare-fun m!423075 () Bool)

(assert (=> b!435170 m!423075))

(declare-fun m!423077 () Bool)

(assert (=> start!39990 m!423077))

(declare-fun m!423079 () Bool)

(assert (=> start!39990 m!423079))

(declare-fun m!423081 () Bool)

(assert (=> b!435177 m!423081))

(declare-fun m!423083 () Bool)

(assert (=> b!435182 m!423083))

(declare-fun m!423085 () Bool)

(assert (=> mapNonEmpty!18735 m!423085))

(declare-fun m!423087 () Bool)

(assert (=> b!435186 m!423087))

(declare-fun m!423089 () Bool)

(assert (=> b!435186 m!423089))

(declare-fun m!423091 () Bool)

(assert (=> b!435186 m!423091))

(declare-fun m!423093 () Bool)

(assert (=> b!435184 m!423093))

(declare-fun m!423095 () Bool)

(assert (=> b!435174 m!423095))

(declare-fun m!423097 () Bool)

(assert (=> b!435183 m!423097))

(declare-fun m!423099 () Bool)

(assert (=> b!435176 m!423099))

(declare-fun m!423101 () Bool)

(assert (=> b!435176 m!423101))

(declare-fun m!423103 () Bool)

(assert (=> b!435176 m!423103))

(declare-fun m!423105 () Bool)

(assert (=> b!435176 m!423105))

(assert (=> b!435176 m!423103))

(assert (=> b!435176 m!423101))

(declare-fun m!423107 () Bool)

(assert (=> b!435176 m!423107))

(declare-fun m!423109 () Bool)

(assert (=> b!435178 m!423109))

(declare-fun m!423111 () Bool)

(assert (=> b!435185 m!423111))

(declare-fun m!423113 () Bool)

(assert (=> b!435185 m!423113))

(declare-fun m!423115 () Bool)

(assert (=> b!435168 m!423115))

(assert (=> b!435168 m!423115))

(declare-fun m!423117 () Bool)

(assert (=> b!435168 m!423117))

(assert (=> b!435168 m!423099))

(assert (=> b!435168 m!423099))

(declare-fun m!423119 () Bool)

(assert (=> b!435168 m!423119))

(assert (=> b!435171 m!423099))

(declare-fun m!423121 () Bool)

(assert (=> b!435171 m!423121))

(declare-fun m!423123 () Bool)

(assert (=> b!435171 m!423123))

(declare-fun m!423125 () Bool)

(assert (=> b!435171 m!423125))

(assert (=> b!435171 m!423099))

(declare-fun m!423127 () Bool)

(assert (=> b!435171 m!423127))

(declare-fun m!423129 () Bool)

(assert (=> b!435171 m!423129))

(check-sat (not b!435186) b_and!18175 (not b!435174) (not b_lambda!9345) (not b!435176) (not b!435171) (not b!435182) (not b!435184) tp_is_empty!11409 (not start!39990) (not b!435177) (not b!435185) (not b!435168) (not b_next!10257) (not b!435183) (not mapNonEmpty!18735) (not b!435178) (not b!435170))
(check-sat b_and!18175 (not b_next!10257))
