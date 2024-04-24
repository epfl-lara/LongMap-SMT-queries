; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39878 () Bool)

(assert start!39878)

(declare-fun b_free!10159 () Bool)

(declare-fun b_next!10159 () Bool)

(assert (=> start!39878 (= b_free!10159 (not b_next!10159))))

(declare-fun tp!36005 () Bool)

(declare-fun b_and!17991 () Bool)

(assert (=> start!39878 (= tp!36005 b_and!17991)))

(declare-fun b!432081 () Bool)

(declare-fun res!254151 () Bool)

(declare-fun e!255610 () Bool)

(assert (=> b!432081 (=> (not res!254151) (not e!255610))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432081 (= res!254151 (bvsle from!863 i!563))))

(declare-fun b!432082 () Bool)

(declare-fun res!254156 () Bool)

(declare-fun e!255618 () Bool)

(assert (=> b!432082 (=> (not res!254156) (not e!255618))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432082 (= res!254156 (validKeyInArray!0 k0!794))))

(declare-fun b!432083 () Bool)

(declare-fun e!255611 () Bool)

(declare-fun e!255613 () Bool)

(assert (=> b!432083 (= e!255611 (not e!255613))))

(declare-fun res!254153 () Bool)

(assert (=> b!432083 (=> res!254153 e!255613)))

(declare-datatypes ((array!26460 0))(
  ( (array!26461 (arr!12679 (Array (_ BitVec 32) (_ BitVec 64))) (size!13031 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26460)

(assert (=> b!432083 (= res!254153 (not (validKeyInArray!0 (select (arr!12679 _keys!709) from!863))))))

(declare-datatypes ((V!16187 0))(
  ( (V!16188 (val!5700 Int)) )
))
(declare-datatypes ((tuple2!7432 0))(
  ( (tuple2!7433 (_1!3727 (_ BitVec 64)) (_2!3727 V!16187)) )
))
(declare-datatypes ((List!7425 0))(
  ( (Nil!7422) (Cons!7421 (h!8277 tuple2!7432) (t!13025 List!7425)) )
))
(declare-datatypes ((ListLongMap!6347 0))(
  ( (ListLongMap!6348 (toList!3189 List!7425)) )
))
(declare-fun lt!198112 () ListLongMap!6347)

(declare-fun lt!198110 () ListLongMap!6347)

(assert (=> b!432083 (= lt!198112 lt!198110)))

(declare-fun lt!198113 () ListLongMap!6347)

(declare-fun lt!198101 () tuple2!7432)

(declare-fun +!1397 (ListLongMap!6347 tuple2!7432) ListLongMap!6347)

(assert (=> b!432083 (= lt!198110 (+!1397 lt!198113 lt!198101))))

(declare-fun minValue!515 () V!16187)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5312 0))(
  ( (ValueCellFull!5312 (v!7948 V!16187)) (EmptyCell!5312) )
))
(declare-datatypes ((array!26462 0))(
  ( (array!26463 (arr!12680 (Array (_ BitVec 32) ValueCell!5312)) (size!13032 (_ BitVec 32))) )
))
(declare-fun lt!198105 () array!26462)

(declare-fun lt!198104 () array!26460)

(declare-fun zeroValue!515 () V!16187)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1428 (array!26460 array!26462 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) Int) ListLongMap!6347)

(assert (=> b!432083 (= lt!198112 (getCurrentListMapNoExtraKeys!1428 lt!198104 lt!198105 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16187)

(assert (=> b!432083 (= lt!198101 (tuple2!7433 k0!794 v!412))))

(declare-fun _values!549 () array!26462)

(assert (=> b!432083 (= lt!198113 (getCurrentListMapNoExtraKeys!1428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12760 0))(
  ( (Unit!12761) )
))
(declare-fun lt!198102 () Unit!12760)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!568 (array!26460 array!26462 (_ BitVec 32) (_ BitVec 32) V!16187 V!16187 (_ BitVec 32) (_ BitVec 64) V!16187 (_ BitVec 32) Int) Unit!12760)

(assert (=> b!432083 (= lt!198102 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432084 () Bool)

(declare-fun res!254150 () Bool)

(assert (=> b!432084 (=> (not res!254150) (not e!255618))))

(assert (=> b!432084 (= res!254150 (or (= (select (arr!12679 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12679 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18588 () Bool)

(declare-fun mapRes!18588 () Bool)

(declare-fun tp!36006 () Bool)

(declare-fun e!255612 () Bool)

(assert (=> mapNonEmpty!18588 (= mapRes!18588 (and tp!36006 e!255612))))

(declare-fun mapRest!18588 () (Array (_ BitVec 32) ValueCell!5312))

(declare-fun mapKey!18588 () (_ BitVec 32))

(declare-fun mapValue!18588 () ValueCell!5312)

(assert (=> mapNonEmpty!18588 (= (arr!12680 _values!549) (store mapRest!18588 mapKey!18588 mapValue!18588))))

(declare-fun b!432086 () Bool)

(declare-fun res!254146 () Bool)

(assert (=> b!432086 (=> (not res!254146) (not e!255610))))

(declare-datatypes ((List!7426 0))(
  ( (Nil!7423) (Cons!7422 (h!8278 (_ BitVec 64)) (t!13026 List!7426)) )
))
(declare-fun arrayNoDuplicates!0 (array!26460 (_ BitVec 32) List!7426) Bool)

(assert (=> b!432086 (= res!254146 (arrayNoDuplicates!0 lt!198104 #b00000000000000000000000000000000 Nil!7423))))

(declare-fun b!432087 () Bool)

(declare-fun e!255616 () Bool)

(declare-fun e!255615 () Bool)

(assert (=> b!432087 (= e!255616 (and e!255615 mapRes!18588))))

(declare-fun condMapEmpty!18588 () Bool)

(declare-fun mapDefault!18588 () ValueCell!5312)

(assert (=> b!432087 (= condMapEmpty!18588 (= (arr!12680 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5312)) mapDefault!18588)))))

(declare-fun b!432088 () Bool)

(declare-fun tp_is_empty!11311 () Bool)

(assert (=> b!432088 (= e!255615 tp_is_empty!11311)))

(declare-fun b!432089 () Bool)

(declare-fun res!254154 () Bool)

(assert (=> b!432089 (=> (not res!254154) (not e!255618))))

(assert (=> b!432089 (= res!254154 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7423))))

(declare-fun b!432090 () Bool)

(assert (=> b!432090 (= e!255612 tp_is_empty!11311)))

(declare-fun b!432091 () Bool)

(declare-fun res!254143 () Bool)

(assert (=> b!432091 (=> (not res!254143) (not e!255618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432091 (= res!254143 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18588 () Bool)

(assert (=> mapIsEmpty!18588 mapRes!18588))

(declare-fun b!432092 () Bool)

(assert (=> b!432092 (= e!255618 e!255610)))

(declare-fun res!254157 () Bool)

(assert (=> b!432092 (=> (not res!254157) (not e!255610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26460 (_ BitVec 32)) Bool)

(assert (=> b!432092 (= res!254157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198104 mask!1025))))

(assert (=> b!432092 (= lt!198104 (array!26461 (store (arr!12679 _keys!709) i!563 k0!794) (size!13031 _keys!709)))))

(declare-fun b!432093 () Bool)

(declare-fun e!255619 () Unit!12760)

(declare-fun Unit!12762 () Unit!12760)

(assert (=> b!432093 (= e!255619 Unit!12762)))

(declare-fun lt!198114 () Unit!12760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26460 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12760)

(assert (=> b!432093 (= lt!198114 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432093 false))

(declare-fun b!432094 () Bool)

(declare-fun res!254155 () Bool)

(assert (=> b!432094 (=> (not res!254155) (not e!255618))))

(declare-fun arrayContainsKey!0 (array!26460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432094 (= res!254155 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432095 () Bool)

(declare-fun res!254145 () Bool)

(assert (=> b!432095 (=> (not res!254145) (not e!255618))))

(assert (=> b!432095 (= res!254145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432096 () Bool)

(declare-fun res!254147 () Bool)

(assert (=> b!432096 (=> (not res!254147) (not e!255618))))

(assert (=> b!432096 (= res!254147 (and (= (size!13032 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13031 _keys!709) (size!13032 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432097 () Bool)

(declare-fun e!255617 () Bool)

(assert (=> b!432097 (= e!255613 e!255617)))

(declare-fun res!254149 () Bool)

(assert (=> b!432097 (=> res!254149 e!255617)))

(assert (=> b!432097 (= res!254149 (= k0!794 (select (arr!12679 _keys!709) from!863)))))

(assert (=> b!432097 (not (= (select (arr!12679 _keys!709) from!863) k0!794))))

(declare-fun lt!198108 () Unit!12760)

(assert (=> b!432097 (= lt!198108 e!255619)))

(declare-fun c!55551 () Bool)

(assert (=> b!432097 (= c!55551 (= (select (arr!12679 _keys!709) from!863) k0!794))))

(declare-fun lt!198103 () ListLongMap!6347)

(declare-fun lt!198106 () ListLongMap!6347)

(assert (=> b!432097 (= lt!198103 lt!198106)))

(declare-fun lt!198111 () tuple2!7432)

(assert (=> b!432097 (= lt!198106 (+!1397 lt!198110 lt!198111))))

(declare-fun lt!198100 () V!16187)

(assert (=> b!432097 (= lt!198111 (tuple2!7433 (select (arr!12679 _keys!709) from!863) lt!198100))))

(declare-fun get!6310 (ValueCell!5312 V!16187) V!16187)

(declare-fun dynLambda!803 (Int (_ BitVec 64)) V!16187)

(assert (=> b!432097 (= lt!198100 (get!6310 (select (arr!12680 _values!549) from!863) (dynLambda!803 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432098 () Bool)

(declare-fun Unit!12763 () Unit!12760)

(assert (=> b!432098 (= e!255619 Unit!12763)))

(declare-fun b!432099 () Bool)

(assert (=> b!432099 (= e!255617 true)))

(assert (=> b!432099 (= lt!198106 (+!1397 (+!1397 lt!198113 lt!198111) lt!198101))))

(declare-fun lt!198107 () Unit!12760)

(declare-fun addCommutativeForDiffKeys!376 (ListLongMap!6347 (_ BitVec 64) V!16187 (_ BitVec 64) V!16187) Unit!12760)

(assert (=> b!432099 (= lt!198107 (addCommutativeForDiffKeys!376 lt!198113 k0!794 v!412 (select (arr!12679 _keys!709) from!863) lt!198100))))

(declare-fun b!432100 () Bool)

(assert (=> b!432100 (= e!255610 e!255611)))

(declare-fun res!254152 () Bool)

(assert (=> b!432100 (=> (not res!254152) (not e!255611))))

(assert (=> b!432100 (= res!254152 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432100 (= lt!198103 (getCurrentListMapNoExtraKeys!1428 lt!198104 lt!198105 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432100 (= lt!198105 (array!26463 (store (arr!12680 _values!549) i!563 (ValueCellFull!5312 v!412)) (size!13032 _values!549)))))

(declare-fun lt!198109 () ListLongMap!6347)

(assert (=> b!432100 (= lt!198109 (getCurrentListMapNoExtraKeys!1428 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!254148 () Bool)

(assert (=> start!39878 (=> (not res!254148) (not e!255618))))

(assert (=> start!39878 (= res!254148 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13031 _keys!709))))))

(assert (=> start!39878 e!255618))

(assert (=> start!39878 tp_is_empty!11311))

(assert (=> start!39878 tp!36005))

(assert (=> start!39878 true))

(declare-fun array_inv!9284 (array!26462) Bool)

(assert (=> start!39878 (and (array_inv!9284 _values!549) e!255616)))

(declare-fun array_inv!9285 (array!26460) Bool)

(assert (=> start!39878 (array_inv!9285 _keys!709)))

(declare-fun b!432085 () Bool)

(declare-fun res!254144 () Bool)

(assert (=> b!432085 (=> (not res!254144) (not e!255618))))

(assert (=> b!432085 (= res!254144 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13031 _keys!709))))))

(assert (= (and start!39878 res!254148) b!432091))

(assert (= (and b!432091 res!254143) b!432096))

(assert (= (and b!432096 res!254147) b!432095))

(assert (= (and b!432095 res!254145) b!432089))

(assert (= (and b!432089 res!254154) b!432085))

(assert (= (and b!432085 res!254144) b!432082))

(assert (= (and b!432082 res!254156) b!432084))

(assert (= (and b!432084 res!254150) b!432094))

(assert (= (and b!432094 res!254155) b!432092))

(assert (= (and b!432092 res!254157) b!432086))

(assert (= (and b!432086 res!254146) b!432081))

(assert (= (and b!432081 res!254151) b!432100))

(assert (= (and b!432100 res!254152) b!432083))

(assert (= (and b!432083 (not res!254153)) b!432097))

(assert (= (and b!432097 c!55551) b!432093))

(assert (= (and b!432097 (not c!55551)) b!432098))

(assert (= (and b!432097 (not res!254149)) b!432099))

(assert (= (and b!432087 condMapEmpty!18588) mapIsEmpty!18588))

(assert (= (and b!432087 (not condMapEmpty!18588)) mapNonEmpty!18588))

(get-info :version)

(assert (= (and mapNonEmpty!18588 ((_ is ValueCellFull!5312) mapValue!18588)) b!432090))

(assert (= (and b!432087 ((_ is ValueCellFull!5312) mapDefault!18588)) b!432088))

(assert (= start!39878 b!432087))

(declare-fun b_lambda!9269 () Bool)

(assert (=> (not b_lambda!9269) (not b!432097)))

(declare-fun t!13024 () Bool)

(declare-fun tb!3557 () Bool)

(assert (=> (and start!39878 (= defaultEntry!557 defaultEntry!557) t!13024) tb!3557))

(declare-fun result!6649 () Bool)

(assert (=> tb!3557 (= result!6649 tp_is_empty!11311)))

(assert (=> b!432097 t!13024))

(declare-fun b_and!17993 () Bool)

(assert (= b_and!17991 (and (=> t!13024 result!6649) b_and!17993)))

(declare-fun m!420449 () Bool)

(assert (=> b!432086 m!420449))

(declare-fun m!420451 () Bool)

(assert (=> b!432097 m!420451))

(declare-fun m!420453 () Bool)

(assert (=> b!432097 m!420453))

(declare-fun m!420455 () Bool)

(assert (=> b!432097 m!420455))

(declare-fun m!420457 () Bool)

(assert (=> b!432097 m!420457))

(assert (=> b!432097 m!420455))

(assert (=> b!432097 m!420453))

(declare-fun m!420459 () Bool)

(assert (=> b!432097 m!420459))

(declare-fun m!420461 () Bool)

(assert (=> b!432094 m!420461))

(declare-fun m!420463 () Bool)

(assert (=> b!432091 m!420463))

(declare-fun m!420465 () Bool)

(assert (=> b!432095 m!420465))

(declare-fun m!420467 () Bool)

(assert (=> b!432084 m!420467))

(declare-fun m!420469 () Bool)

(assert (=> b!432100 m!420469))

(declare-fun m!420471 () Bool)

(assert (=> b!432100 m!420471))

(declare-fun m!420473 () Bool)

(assert (=> b!432100 m!420473))

(declare-fun m!420475 () Bool)

(assert (=> b!432092 m!420475))

(declare-fun m!420477 () Bool)

(assert (=> b!432092 m!420477))

(declare-fun m!420479 () Bool)

(assert (=> mapNonEmpty!18588 m!420479))

(declare-fun m!420481 () Bool)

(assert (=> start!39878 m!420481))

(declare-fun m!420483 () Bool)

(assert (=> start!39878 m!420483))

(declare-fun m!420485 () Bool)

(assert (=> b!432082 m!420485))

(declare-fun m!420487 () Bool)

(assert (=> b!432089 m!420487))

(declare-fun m!420489 () Bool)

(assert (=> b!432093 m!420489))

(declare-fun m!420491 () Bool)

(assert (=> b!432099 m!420491))

(assert (=> b!432099 m!420491))

(declare-fun m!420493 () Bool)

(assert (=> b!432099 m!420493))

(assert (=> b!432099 m!420451))

(assert (=> b!432099 m!420451))

(declare-fun m!420495 () Bool)

(assert (=> b!432099 m!420495))

(assert (=> b!432083 m!420451))

(declare-fun m!420497 () Bool)

(assert (=> b!432083 m!420497))

(declare-fun m!420499 () Bool)

(assert (=> b!432083 m!420499))

(assert (=> b!432083 m!420451))

(declare-fun m!420501 () Bool)

(assert (=> b!432083 m!420501))

(declare-fun m!420503 () Bool)

(assert (=> b!432083 m!420503))

(declare-fun m!420505 () Bool)

(assert (=> b!432083 m!420505))

(check-sat (not b_lambda!9269) (not b!432091) (not b_next!10159) (not b!432083) tp_is_empty!11311 (not b!432095) b_and!17993 (not b!432097) (not b!432089) (not b!432082) (not b!432094) (not b!432100) (not b!432086) (not mapNonEmpty!18588) (not b!432093) (not start!39878) (not b!432099) (not b!432092))
(check-sat b_and!17993 (not b_next!10159))
