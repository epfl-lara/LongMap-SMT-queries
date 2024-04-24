; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39848 () Bool)

(assert start!39848)

(declare-fun b_free!10129 () Bool)

(declare-fun b_next!10129 () Bool)

(assert (=> start!39848 (= b_free!10129 (not b_next!10129))))

(declare-fun tp!35916 () Bool)

(declare-fun b_and!17931 () Bool)

(assert (=> start!39848 (= tp!35916 b_and!17931)))

(declare-fun b!431151 () Bool)

(declare-fun res!253470 () Bool)

(declare-fun e!255169 () Bool)

(assert (=> b!431151 (=> (not res!253470) (not e!255169))))

(declare-datatypes ((array!26402 0))(
  ( (array!26403 (arr!12650 (Array (_ BitVec 32) (_ BitVec 64))) (size!13002 (_ BitVec 32))) )
))
(declare-fun lt!197438 () array!26402)

(declare-datatypes ((List!7400 0))(
  ( (Nil!7397) (Cons!7396 (h!8252 (_ BitVec 64)) (t!12970 List!7400)) )
))
(declare-fun arrayNoDuplicates!0 (array!26402 (_ BitVec 32) List!7400) Bool)

(assert (=> b!431151 (= res!253470 (arrayNoDuplicates!0 lt!197438 #b00000000000000000000000000000000 Nil!7397))))

(declare-fun b!431152 () Bool)

(declare-fun res!253468 () Bool)

(declare-fun e!255164 () Bool)

(assert (=> b!431152 (=> (not res!253468) (not e!255164))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431152 (= res!253468 (validMask!0 mask!1025))))

(declare-fun b!431153 () Bool)

(declare-fun e!255160 () Bool)

(declare-fun tp_is_empty!11281 () Bool)

(assert (=> b!431153 (= e!255160 tp_is_empty!11281)))

(declare-fun res!253475 () Bool)

(assert (=> start!39848 (=> (not res!253475) (not e!255164))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!26402)

(assert (=> start!39848 (= res!253475 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13002 _keys!709))))))

(assert (=> start!39848 e!255164))

(assert (=> start!39848 tp_is_empty!11281))

(assert (=> start!39848 tp!35916))

(assert (=> start!39848 true))

(declare-datatypes ((V!16147 0))(
  ( (V!16148 (val!5685 Int)) )
))
(declare-datatypes ((ValueCell!5297 0))(
  ( (ValueCellFull!5297 (v!7933 V!16147)) (EmptyCell!5297) )
))
(declare-datatypes ((array!26404 0))(
  ( (array!26405 (arr!12651 (Array (_ BitVec 32) ValueCell!5297)) (size!13003 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26404)

(declare-fun e!255165 () Bool)

(declare-fun array_inv!9272 (array!26404) Bool)

(assert (=> start!39848 (and (array_inv!9272 _values!549) e!255165)))

(declare-fun array_inv!9273 (array!26402) Bool)

(assert (=> start!39848 (array_inv!9273 _keys!709)))

(declare-fun b!431154 () Bool)

(declare-fun res!253482 () Bool)

(assert (=> b!431154 (=> (not res!253482) (not e!255164))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431154 (= res!253482 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13002 _keys!709))))))

(declare-fun b!431155 () Bool)

(declare-fun e!255167 () Bool)

(declare-fun e!255163 () Bool)

(assert (=> b!431155 (= e!255167 (not e!255163))))

(declare-fun res!253481 () Bool)

(assert (=> b!431155 (=> res!253481 e!255163)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431155 (= res!253481 (not (validKeyInArray!0 (select (arr!12650 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7404 0))(
  ( (tuple2!7405 (_1!3713 (_ BitVec 64)) (_2!3713 V!16147)) )
))
(declare-datatypes ((List!7401 0))(
  ( (Nil!7398) (Cons!7397 (h!8253 tuple2!7404) (t!12971 List!7401)) )
))
(declare-datatypes ((ListLongMap!6319 0))(
  ( (ListLongMap!6320 (toList!3175 List!7401)) )
))
(declare-fun lt!197430 () ListLongMap!6319)

(declare-fun lt!197426 () ListLongMap!6319)

(assert (=> b!431155 (= lt!197430 lt!197426)))

(declare-fun lt!197432 () ListLongMap!6319)

(declare-fun lt!197425 () tuple2!7404)

(declare-fun +!1383 (ListLongMap!6319 tuple2!7404) ListLongMap!6319)

(assert (=> b!431155 (= lt!197426 (+!1383 lt!197432 lt!197425))))

(declare-fun minValue!515 () V!16147)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!197428 () array!26404)

(declare-fun zeroValue!515 () V!16147)

(declare-fun getCurrentListMapNoExtraKeys!1418 (array!26402 array!26404 (_ BitVec 32) (_ BitVec 32) V!16147 V!16147 (_ BitVec 32) Int) ListLongMap!6319)

(assert (=> b!431155 (= lt!197430 (getCurrentListMapNoExtraKeys!1418 lt!197438 lt!197428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16147)

(assert (=> b!431155 (= lt!197425 (tuple2!7405 k0!794 v!412))))

(assert (=> b!431155 (= lt!197432 (getCurrentListMapNoExtraKeys!1418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12713 0))(
  ( (Unit!12714) )
))
(declare-fun lt!197436 () Unit!12713)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!559 (array!26402 array!26404 (_ BitVec 32) (_ BitVec 32) V!16147 V!16147 (_ BitVec 32) (_ BitVec 64) V!16147 (_ BitVec 32) Int) Unit!12713)

(assert (=> b!431155 (= lt!197436 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431156 () Bool)

(assert (=> b!431156 (= e!255164 e!255169)))

(declare-fun res!253472 () Bool)

(assert (=> b!431156 (=> (not res!253472) (not e!255169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26402 (_ BitVec 32)) Bool)

(assert (=> b!431156 (= res!253472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197438 mask!1025))))

(assert (=> b!431156 (= lt!197438 (array!26403 (store (arr!12650 _keys!709) i!563 k0!794) (size!13002 _keys!709)))))

(declare-fun b!431157 () Bool)

(declare-fun res!253478 () Bool)

(assert (=> b!431157 (=> (not res!253478) (not e!255164))))

(assert (=> b!431157 (= res!253478 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7397))))

(declare-fun b!431158 () Bool)

(declare-fun res!253479 () Bool)

(assert (=> b!431158 (=> (not res!253479) (not e!255169))))

(assert (=> b!431158 (= res!253479 (bvsle from!863 i!563))))

(declare-fun b!431159 () Bool)

(declare-fun res!253474 () Bool)

(assert (=> b!431159 (=> (not res!253474) (not e!255164))))

(assert (=> b!431159 (= res!253474 (or (= (select (arr!12650 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12650 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431160 () Bool)

(declare-fun e!255168 () Bool)

(assert (=> b!431160 (= e!255168 tp_is_empty!11281)))

(declare-fun b!431161 () Bool)

(declare-fun res!253480 () Bool)

(assert (=> b!431161 (=> (not res!253480) (not e!255164))))

(assert (=> b!431161 (= res!253480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18543 () Bool)

(declare-fun mapRes!18543 () Bool)

(assert (=> mapIsEmpty!18543 mapRes!18543))

(declare-fun b!431162 () Bool)

(declare-fun e!255166 () Unit!12713)

(declare-fun Unit!12715 () Unit!12713)

(assert (=> b!431162 (= e!255166 Unit!12715)))

(declare-fun b!431163 () Bool)

(declare-fun Unit!12716 () Unit!12713)

(assert (=> b!431163 (= e!255166 Unit!12716)))

(declare-fun lt!197433 () Unit!12713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26402 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12713)

(assert (=> b!431163 (= lt!197433 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431163 false))

(declare-fun b!431164 () Bool)

(declare-fun e!255162 () Bool)

(assert (=> b!431164 (= e!255162 true)))

(declare-fun lt!197429 () ListLongMap!6319)

(declare-fun lt!197434 () tuple2!7404)

(assert (=> b!431164 (= lt!197429 (+!1383 (+!1383 lt!197432 lt!197434) lt!197425))))

(declare-fun lt!197439 () Unit!12713)

(declare-fun lt!197431 () V!16147)

(declare-fun addCommutativeForDiffKeys!363 (ListLongMap!6319 (_ BitVec 64) V!16147 (_ BitVec 64) V!16147) Unit!12713)

(assert (=> b!431164 (= lt!197439 (addCommutativeForDiffKeys!363 lt!197432 k0!794 v!412 (select (arr!12650 _keys!709) from!863) lt!197431))))

(declare-fun mapNonEmpty!18543 () Bool)

(declare-fun tp!35915 () Bool)

(assert (=> mapNonEmpty!18543 (= mapRes!18543 (and tp!35915 e!255168))))

(declare-fun mapValue!18543 () ValueCell!5297)

(declare-fun mapRest!18543 () (Array (_ BitVec 32) ValueCell!5297))

(declare-fun mapKey!18543 () (_ BitVec 32))

(assert (=> mapNonEmpty!18543 (= (arr!12651 _values!549) (store mapRest!18543 mapKey!18543 mapValue!18543))))

(declare-fun b!431165 () Bool)

(assert (=> b!431165 (= e!255169 e!255167)))

(declare-fun res!253476 () Bool)

(assert (=> b!431165 (=> (not res!253476) (not e!255167))))

(assert (=> b!431165 (= res!253476 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197427 () ListLongMap!6319)

(assert (=> b!431165 (= lt!197427 (getCurrentListMapNoExtraKeys!1418 lt!197438 lt!197428 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431165 (= lt!197428 (array!26405 (store (arr!12651 _values!549) i!563 (ValueCellFull!5297 v!412)) (size!13003 _values!549)))))

(declare-fun lt!197437 () ListLongMap!6319)

(assert (=> b!431165 (= lt!197437 (getCurrentListMapNoExtraKeys!1418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431166 () Bool)

(declare-fun res!253473 () Bool)

(assert (=> b!431166 (=> (not res!253473) (not e!255164))))

(declare-fun arrayContainsKey!0 (array!26402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431166 (= res!253473 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!431167 () Bool)

(assert (=> b!431167 (= e!255165 (and e!255160 mapRes!18543))))

(declare-fun condMapEmpty!18543 () Bool)

(declare-fun mapDefault!18543 () ValueCell!5297)

(assert (=> b!431167 (= condMapEmpty!18543 (= (arr!12651 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5297)) mapDefault!18543)))))

(declare-fun b!431168 () Bool)

(declare-fun res!253471 () Bool)

(assert (=> b!431168 (=> (not res!253471) (not e!255164))))

(assert (=> b!431168 (= res!253471 (validKeyInArray!0 k0!794))))

(declare-fun b!431169 () Bool)

(declare-fun res!253469 () Bool)

(assert (=> b!431169 (=> (not res!253469) (not e!255164))))

(assert (=> b!431169 (= res!253469 (and (= (size!13003 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13002 _keys!709) (size!13003 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431170 () Bool)

(assert (=> b!431170 (= e!255163 e!255162)))

(declare-fun res!253477 () Bool)

(assert (=> b!431170 (=> res!253477 e!255162)))

(assert (=> b!431170 (= res!253477 (= k0!794 (select (arr!12650 _keys!709) from!863)))))

(assert (=> b!431170 (not (= (select (arr!12650 _keys!709) from!863) k0!794))))

(declare-fun lt!197435 () Unit!12713)

(assert (=> b!431170 (= lt!197435 e!255166)))

(declare-fun c!55506 () Bool)

(assert (=> b!431170 (= c!55506 (= (select (arr!12650 _keys!709) from!863) k0!794))))

(assert (=> b!431170 (= lt!197427 lt!197429)))

(assert (=> b!431170 (= lt!197429 (+!1383 lt!197426 lt!197434))))

(assert (=> b!431170 (= lt!197434 (tuple2!7405 (select (arr!12650 _keys!709) from!863) lt!197431))))

(declare-fun get!6291 (ValueCell!5297 V!16147) V!16147)

(declare-fun dynLambda!794 (Int (_ BitVec 64)) V!16147)

(assert (=> b!431170 (= lt!197431 (get!6291 (select (arr!12651 _values!549) from!863) (dynLambda!794 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39848 res!253475) b!431152))

(assert (= (and b!431152 res!253468) b!431169))

(assert (= (and b!431169 res!253469) b!431161))

(assert (= (and b!431161 res!253480) b!431157))

(assert (= (and b!431157 res!253478) b!431154))

(assert (= (and b!431154 res!253482) b!431168))

(assert (= (and b!431168 res!253471) b!431159))

(assert (= (and b!431159 res!253474) b!431166))

(assert (= (and b!431166 res!253473) b!431156))

(assert (= (and b!431156 res!253472) b!431151))

(assert (= (and b!431151 res!253470) b!431158))

(assert (= (and b!431158 res!253479) b!431165))

(assert (= (and b!431165 res!253476) b!431155))

(assert (= (and b!431155 (not res!253481)) b!431170))

(assert (= (and b!431170 c!55506) b!431163))

(assert (= (and b!431170 (not c!55506)) b!431162))

(assert (= (and b!431170 (not res!253477)) b!431164))

(assert (= (and b!431167 condMapEmpty!18543) mapIsEmpty!18543))

(assert (= (and b!431167 (not condMapEmpty!18543)) mapNonEmpty!18543))

(get-info :version)

(assert (= (and mapNonEmpty!18543 ((_ is ValueCellFull!5297) mapValue!18543)) b!431160))

(assert (= (and b!431167 ((_ is ValueCellFull!5297) mapDefault!18543)) b!431153))

(assert (= start!39848 b!431167))

(declare-fun b_lambda!9239 () Bool)

(assert (=> (not b_lambda!9239) (not b!431170)))

(declare-fun t!12969 () Bool)

(declare-fun tb!3527 () Bool)

(assert (=> (and start!39848 (= defaultEntry!557 defaultEntry!557) t!12969) tb!3527))

(declare-fun result!6589 () Bool)

(assert (=> tb!3527 (= result!6589 tp_is_empty!11281)))

(assert (=> b!431170 t!12969))

(declare-fun b_and!17933 () Bool)

(assert (= b_and!17931 (and (=> t!12969 result!6589) b_and!17933)))

(declare-fun m!419579 () Bool)

(assert (=> b!431166 m!419579))

(declare-fun m!419581 () Bool)

(assert (=> b!431156 m!419581))

(declare-fun m!419583 () Bool)

(assert (=> b!431156 m!419583))

(declare-fun m!419585 () Bool)

(assert (=> b!431161 m!419585))

(declare-fun m!419587 () Bool)

(assert (=> b!431170 m!419587))

(declare-fun m!419589 () Bool)

(assert (=> b!431170 m!419589))

(declare-fun m!419591 () Bool)

(assert (=> b!431170 m!419591))

(declare-fun m!419593 () Bool)

(assert (=> b!431170 m!419593))

(assert (=> b!431170 m!419593))

(assert (=> b!431170 m!419591))

(declare-fun m!419595 () Bool)

(assert (=> b!431170 m!419595))

(declare-fun m!419597 () Bool)

(assert (=> b!431165 m!419597))

(declare-fun m!419599 () Bool)

(assert (=> b!431165 m!419599))

(declare-fun m!419601 () Bool)

(assert (=> b!431165 m!419601))

(declare-fun m!419603 () Bool)

(assert (=> b!431159 m!419603))

(assert (=> b!431155 m!419587))

(declare-fun m!419605 () Bool)

(assert (=> b!431155 m!419605))

(declare-fun m!419607 () Bool)

(assert (=> b!431155 m!419607))

(declare-fun m!419609 () Bool)

(assert (=> b!431155 m!419609))

(assert (=> b!431155 m!419587))

(declare-fun m!419611 () Bool)

(assert (=> b!431155 m!419611))

(declare-fun m!419613 () Bool)

(assert (=> b!431155 m!419613))

(declare-fun m!419615 () Bool)

(assert (=> b!431163 m!419615))

(declare-fun m!419617 () Bool)

(assert (=> b!431168 m!419617))

(declare-fun m!419619 () Bool)

(assert (=> mapNonEmpty!18543 m!419619))

(declare-fun m!419621 () Bool)

(assert (=> b!431151 m!419621))

(declare-fun m!419623 () Bool)

(assert (=> b!431164 m!419623))

(assert (=> b!431164 m!419623))

(declare-fun m!419625 () Bool)

(assert (=> b!431164 m!419625))

(assert (=> b!431164 m!419587))

(assert (=> b!431164 m!419587))

(declare-fun m!419627 () Bool)

(assert (=> b!431164 m!419627))

(declare-fun m!419629 () Bool)

(assert (=> b!431152 m!419629))

(declare-fun m!419631 () Bool)

(assert (=> b!431157 m!419631))

(declare-fun m!419633 () Bool)

(assert (=> start!39848 m!419633))

(declare-fun m!419635 () Bool)

(assert (=> start!39848 m!419635))

(check-sat (not b!431164) (not start!39848) (not b_lambda!9239) (not b!431166) (not b!431152) tp_is_empty!11281 (not b!431157) (not b!431155) (not b!431170) (not b_next!10129) (not b!431168) (not b!431151) (not mapNonEmpty!18543) (not b!431161) (not b!431165) (not b!431163) (not b!431156) b_and!17933)
(check-sat b_and!17933 (not b_next!10129))
