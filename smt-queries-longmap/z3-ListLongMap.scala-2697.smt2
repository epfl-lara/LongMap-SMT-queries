; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39986 () Bool)

(assert start!39986)

(declare-fun b_free!10267 () Bool)

(declare-fun b_next!10267 () Bool)

(assert (=> start!39986 (= b_free!10267 (not b_next!10267))))

(declare-fun tp!36330 () Bool)

(declare-fun b_and!18167 () Bool)

(assert (=> start!39986 (= tp!36330 b_and!18167)))

(declare-fun b!435207 () Bool)

(declare-fun e!257089 () Bool)

(assert (=> b!435207 (= e!257089 true)))

(declare-datatypes ((V!16331 0))(
  ( (V!16332 (val!5754 Int)) )
))
(declare-datatypes ((tuple2!7630 0))(
  ( (tuple2!7631 (_1!3826 (_ BitVec 64)) (_2!3826 V!16331)) )
))
(declare-datatypes ((List!7617 0))(
  ( (Nil!7614) (Cons!7613 (h!8469 tuple2!7630) (t!13324 List!7617)) )
))
(declare-datatypes ((ListLongMap!6533 0))(
  ( (ListLongMap!6534 (toList!3282 List!7617)) )
))
(declare-fun lt!200287 () ListLongMap!6533)

(declare-fun lt!200289 () tuple2!7630)

(declare-fun lt!200291 () tuple2!7630)

(declare-fun lt!200278 () ListLongMap!6533)

(declare-fun +!1457 (ListLongMap!6533 tuple2!7630) ListLongMap!6533)

(assert (=> b!435207 (= lt!200287 (+!1457 (+!1457 lt!200278 lt!200291) lt!200289))))

(declare-fun lt!200282 () V!16331)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12903 0))(
  ( (Unit!12904) )
))
(declare-fun lt!200285 () Unit!12903)

(declare-fun v!412 () V!16331)

(declare-datatypes ((array!26661 0))(
  ( (array!26662 (arr!12780 (Array (_ BitVec 32) (_ BitVec 64))) (size!13133 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26661)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!407 (ListLongMap!6533 (_ BitVec 64) V!16331 (_ BitVec 64) V!16331) Unit!12903)

(assert (=> b!435207 (= lt!200285 (addCommutativeForDiffKeys!407 lt!200278 k0!794 v!412 (select (arr!12780 _keys!709) from!863) lt!200282))))

(declare-fun b!435208 () Bool)

(declare-fun res!256461 () Bool)

(declare-fun e!257096 () Bool)

(assert (=> b!435208 (=> (not res!256461) (not e!257096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435208 (= res!256461 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18750 () Bool)

(declare-fun mapRes!18750 () Bool)

(assert (=> mapIsEmpty!18750 mapRes!18750))

(declare-fun b!435209 () Bool)

(declare-fun e!257094 () Unit!12903)

(declare-fun Unit!12905 () Unit!12903)

(assert (=> b!435209 (= e!257094 Unit!12905)))

(declare-fun lt!200280 () Unit!12903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26661 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12903)

(assert (=> b!435209 (= lt!200280 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435209 false))

(declare-fun b!435210 () Bool)

(declare-fun res!256454 () Bool)

(declare-fun e!257093 () Bool)

(assert (=> b!435210 (=> (not res!256454) (not e!257093))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435210 (= res!256454 (bvsle from!863 i!563))))

(declare-fun b!435211 () Bool)

(declare-fun res!256452 () Bool)

(assert (=> b!435211 (=> (not res!256452) (not e!257096))))

(declare-datatypes ((List!7618 0))(
  ( (Nil!7615) (Cons!7614 (h!8470 (_ BitVec 64)) (t!13325 List!7618)) )
))
(declare-fun arrayNoDuplicates!0 (array!26661 (_ BitVec 32) List!7618) Bool)

(assert (=> b!435211 (= res!256452 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7615))))

(declare-fun b!435213 () Bool)

(declare-fun res!256450 () Bool)

(assert (=> b!435213 (=> (not res!256450) (not e!257096))))

(declare-fun arrayContainsKey!0 (array!26661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435213 (= res!256450 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435214 () Bool)

(declare-fun e!257090 () Bool)

(declare-fun e!257091 () Bool)

(assert (=> b!435214 (= e!257090 (and e!257091 mapRes!18750))))

(declare-fun condMapEmpty!18750 () Bool)

(declare-datatypes ((ValueCell!5366 0))(
  ( (ValueCellFull!5366 (v!7995 V!16331)) (EmptyCell!5366) )
))
(declare-datatypes ((array!26663 0))(
  ( (array!26664 (arr!12781 (Array (_ BitVec 32) ValueCell!5366)) (size!13134 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26663)

(declare-fun mapDefault!18750 () ValueCell!5366)

(assert (=> b!435214 (= condMapEmpty!18750 (= (arr!12781 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5366)) mapDefault!18750)))))

(declare-fun b!435215 () Bool)

(declare-fun Unit!12906 () Unit!12903)

(assert (=> b!435215 (= e!257094 Unit!12906)))

(declare-fun b!435216 () Bool)

(declare-fun e!257097 () Bool)

(declare-fun e!257095 () Bool)

(assert (=> b!435216 (= e!257097 (not e!257095))))

(declare-fun res!256453 () Bool)

(assert (=> b!435216 (=> res!256453 e!257095)))

(assert (=> b!435216 (= res!256453 (not (validKeyInArray!0 (select (arr!12780 _keys!709) from!863))))))

(declare-fun lt!200286 () ListLongMap!6533)

(declare-fun lt!200284 () ListLongMap!6533)

(assert (=> b!435216 (= lt!200286 lt!200284)))

(assert (=> b!435216 (= lt!200284 (+!1457 lt!200278 lt!200289))))

(declare-fun lt!200279 () array!26663)

(declare-fun minValue!515 () V!16331)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16331)

(declare-fun lt!200281 () array!26661)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1482 (array!26661 array!26663 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) Int) ListLongMap!6533)

(assert (=> b!435216 (= lt!200286 (getCurrentListMapNoExtraKeys!1482 lt!200281 lt!200279 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435216 (= lt!200289 (tuple2!7631 k0!794 v!412))))

(assert (=> b!435216 (= lt!200278 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200288 () Unit!12903)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 (array!26661 array!26663 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) (_ BitVec 64) V!16331 (_ BitVec 32) Int) Unit!12903)

(assert (=> b!435216 (= lt!200288 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18750 () Bool)

(declare-fun tp!36329 () Bool)

(declare-fun e!257092 () Bool)

(assert (=> mapNonEmpty!18750 (= mapRes!18750 (and tp!36329 e!257092))))

(declare-fun mapKey!18750 () (_ BitVec 32))

(declare-fun mapValue!18750 () ValueCell!5366)

(declare-fun mapRest!18750 () (Array (_ BitVec 32) ValueCell!5366))

(assert (=> mapNonEmpty!18750 (= (arr!12781 _values!549) (store mapRest!18750 mapKey!18750 mapValue!18750))))

(declare-fun b!435217 () Bool)

(declare-fun res!256449 () Bool)

(assert (=> b!435217 (=> (not res!256449) (not e!257096))))

(assert (=> b!435217 (= res!256449 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13133 _keys!709))))))

(declare-fun b!435218 () Bool)

(declare-fun res!256451 () Bool)

(assert (=> b!435218 (=> (not res!256451) (not e!257096))))

(assert (=> b!435218 (= res!256451 (or (= (select (arr!12780 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12780 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435219 () Bool)

(declare-fun tp_is_empty!11419 () Bool)

(assert (=> b!435219 (= e!257092 tp_is_empty!11419)))

(declare-fun b!435220 () Bool)

(assert (=> b!435220 (= e!257095 e!257089)))

(declare-fun res!256460 () Bool)

(assert (=> b!435220 (=> res!256460 e!257089)))

(assert (=> b!435220 (= res!256460 (= k0!794 (select (arr!12780 _keys!709) from!863)))))

(assert (=> b!435220 (not (= (select (arr!12780 _keys!709) from!863) k0!794))))

(declare-fun lt!200283 () Unit!12903)

(assert (=> b!435220 (= lt!200283 e!257094)))

(declare-fun c!55665 () Bool)

(assert (=> b!435220 (= c!55665 (= (select (arr!12780 _keys!709) from!863) k0!794))))

(declare-fun lt!200277 () ListLongMap!6533)

(assert (=> b!435220 (= lt!200277 lt!200287)))

(assert (=> b!435220 (= lt!200287 (+!1457 lt!200284 lt!200291))))

(assert (=> b!435220 (= lt!200291 (tuple2!7631 (select (arr!12780 _keys!709) from!863) lt!200282))))

(declare-fun get!6375 (ValueCell!5366 V!16331) V!16331)

(declare-fun dynLambda!835 (Int (_ BitVec 64)) V!16331)

(assert (=> b!435220 (= lt!200282 (get!6375 (select (arr!12781 _values!549) from!863) (dynLambda!835 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435221 () Bool)

(assert (=> b!435221 (= e!257096 e!257093)))

(declare-fun res!256447 () Bool)

(assert (=> b!435221 (=> (not res!256447) (not e!257093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26661 (_ BitVec 32)) Bool)

(assert (=> b!435221 (= res!256447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200281 mask!1025))))

(assert (=> b!435221 (= lt!200281 (array!26662 (store (arr!12780 _keys!709) i!563 k0!794) (size!13133 _keys!709)))))

(declare-fun b!435222 () Bool)

(assert (=> b!435222 (= e!257091 tp_is_empty!11419)))

(declare-fun b!435223 () Bool)

(assert (=> b!435223 (= e!257093 e!257097)))

(declare-fun res!256448 () Bool)

(assert (=> b!435223 (=> (not res!256448) (not e!257097))))

(assert (=> b!435223 (= res!256448 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435223 (= lt!200277 (getCurrentListMapNoExtraKeys!1482 lt!200281 lt!200279 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435223 (= lt!200279 (array!26664 (store (arr!12781 _values!549) i!563 (ValueCellFull!5366 v!412)) (size!13134 _values!549)))))

(declare-fun lt!200290 () ListLongMap!6533)

(assert (=> b!435223 (= lt!200290 (getCurrentListMapNoExtraKeys!1482 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435224 () Bool)

(declare-fun res!256456 () Bool)

(assert (=> b!435224 (=> (not res!256456) (not e!257096))))

(assert (=> b!435224 (= res!256456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!256459 () Bool)

(assert (=> start!39986 (=> (not res!256459) (not e!257096))))

(assert (=> start!39986 (= res!256459 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13133 _keys!709))))))

(assert (=> start!39986 e!257096))

(assert (=> start!39986 tp_is_empty!11419))

(assert (=> start!39986 tp!36330))

(assert (=> start!39986 true))

(declare-fun array_inv!9328 (array!26663) Bool)

(assert (=> start!39986 (and (array_inv!9328 _values!549) e!257090)))

(declare-fun array_inv!9329 (array!26661) Bool)

(assert (=> start!39986 (array_inv!9329 _keys!709)))

(declare-fun b!435212 () Bool)

(declare-fun res!256458 () Bool)

(assert (=> b!435212 (=> (not res!256458) (not e!257096))))

(assert (=> b!435212 (= res!256458 (and (= (size!13134 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13133 _keys!709) (size!13134 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435225 () Bool)

(declare-fun res!256455 () Bool)

(assert (=> b!435225 (=> (not res!256455) (not e!257096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435225 (= res!256455 (validMask!0 mask!1025))))

(declare-fun b!435226 () Bool)

(declare-fun res!256457 () Bool)

(assert (=> b!435226 (=> (not res!256457) (not e!257093))))

(assert (=> b!435226 (= res!256457 (arrayNoDuplicates!0 lt!200281 #b00000000000000000000000000000000 Nil!7615))))

(assert (= (and start!39986 res!256459) b!435225))

(assert (= (and b!435225 res!256455) b!435212))

(assert (= (and b!435212 res!256458) b!435224))

(assert (= (and b!435224 res!256456) b!435211))

(assert (= (and b!435211 res!256452) b!435217))

(assert (= (and b!435217 res!256449) b!435208))

(assert (= (and b!435208 res!256461) b!435218))

(assert (= (and b!435218 res!256451) b!435213))

(assert (= (and b!435213 res!256450) b!435221))

(assert (= (and b!435221 res!256447) b!435226))

(assert (= (and b!435226 res!256457) b!435210))

(assert (= (and b!435210 res!256454) b!435223))

(assert (= (and b!435223 res!256448) b!435216))

(assert (= (and b!435216 (not res!256453)) b!435220))

(assert (= (and b!435220 c!55665) b!435209))

(assert (= (and b!435220 (not c!55665)) b!435215))

(assert (= (and b!435220 (not res!256460)) b!435207))

(assert (= (and b!435214 condMapEmpty!18750) mapIsEmpty!18750))

(assert (= (and b!435214 (not condMapEmpty!18750)) mapNonEmpty!18750))

(get-info :version)

(assert (= (and mapNonEmpty!18750 ((_ is ValueCellFull!5366) mapValue!18750)) b!435219))

(assert (= (and b!435214 ((_ is ValueCellFull!5366) mapDefault!18750)) b!435222))

(assert (= start!39986 b!435214))

(declare-fun b_lambda!9337 () Bool)

(assert (=> (not b_lambda!9337) (not b!435220)))

(declare-fun t!13323 () Bool)

(declare-fun tb!3665 () Bool)

(assert (=> (and start!39986 (= defaultEntry!557 defaultEntry!557) t!13323) tb!3665))

(declare-fun result!6865 () Bool)

(assert (=> tb!3665 (= result!6865 tp_is_empty!11419)))

(assert (=> b!435220 t!13323))

(declare-fun b_and!18169 () Bool)

(assert (= b_and!18167 (and (=> t!13323 result!6865) b_and!18169)))

(declare-fun m!422631 () Bool)

(assert (=> b!435213 m!422631))

(declare-fun m!422633 () Bool)

(assert (=> b!435224 m!422633))

(declare-fun m!422635 () Bool)

(assert (=> b!435216 m!422635))

(declare-fun m!422637 () Bool)

(assert (=> b!435216 m!422637))

(declare-fun m!422639 () Bool)

(assert (=> b!435216 m!422639))

(declare-fun m!422641 () Bool)

(assert (=> b!435216 m!422641))

(assert (=> b!435216 m!422635))

(declare-fun m!422643 () Bool)

(assert (=> b!435216 m!422643))

(declare-fun m!422645 () Bool)

(assert (=> b!435216 m!422645))

(declare-fun m!422647 () Bool)

(assert (=> start!39986 m!422647))

(declare-fun m!422649 () Bool)

(assert (=> start!39986 m!422649))

(declare-fun m!422651 () Bool)

(assert (=> b!435226 m!422651))

(declare-fun m!422653 () Bool)

(assert (=> mapNonEmpty!18750 m!422653))

(declare-fun m!422655 () Bool)

(assert (=> b!435223 m!422655))

(declare-fun m!422657 () Bool)

(assert (=> b!435223 m!422657))

(declare-fun m!422659 () Bool)

(assert (=> b!435223 m!422659))

(declare-fun m!422661 () Bool)

(assert (=> b!435209 m!422661))

(declare-fun m!422663 () Bool)

(assert (=> b!435218 m!422663))

(declare-fun m!422665 () Bool)

(assert (=> b!435221 m!422665))

(declare-fun m!422667 () Bool)

(assert (=> b!435221 m!422667))

(declare-fun m!422669 () Bool)

(assert (=> b!435225 m!422669))

(declare-fun m!422671 () Bool)

(assert (=> b!435211 m!422671))

(declare-fun m!422673 () Bool)

(assert (=> b!435207 m!422673))

(assert (=> b!435207 m!422673))

(declare-fun m!422675 () Bool)

(assert (=> b!435207 m!422675))

(assert (=> b!435207 m!422635))

(assert (=> b!435207 m!422635))

(declare-fun m!422677 () Bool)

(assert (=> b!435207 m!422677))

(assert (=> b!435220 m!422635))

(declare-fun m!422679 () Bool)

(assert (=> b!435220 m!422679))

(declare-fun m!422681 () Bool)

(assert (=> b!435220 m!422681))

(declare-fun m!422683 () Bool)

(assert (=> b!435220 m!422683))

(assert (=> b!435220 m!422683))

(assert (=> b!435220 m!422679))

(declare-fun m!422685 () Bool)

(assert (=> b!435220 m!422685))

(declare-fun m!422687 () Bool)

(assert (=> b!435208 m!422687))

(check-sat (not b!435223) (not b!435207) (not b!435213) (not b!435226) (not b!435209) (not b!435221) (not b!435225) (not mapNonEmpty!18750) tp_is_empty!11419 (not b!435208) (not b!435216) (not b!435220) (not b!435224) (not b_next!10267) (not b_lambda!9337) (not start!39986) b_and!18169 (not b!435211))
(check-sat b_and!18169 (not b_next!10267))
