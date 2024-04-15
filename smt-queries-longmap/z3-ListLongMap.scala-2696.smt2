; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39980 () Bool)

(assert start!39980)

(declare-fun b_free!10261 () Bool)

(declare-fun b_next!10261 () Bool)

(assert (=> start!39980 (= b_free!10261 (not b_next!10261))))

(declare-fun tp!36312 () Bool)

(declare-fun b_and!18155 () Bool)

(assert (=> start!39980 (= tp!36312 b_and!18155)))

(declare-fun b!435021 () Bool)

(declare-fun e!257000 () Bool)

(declare-fun tp_is_empty!11413 () Bool)

(assert (=> b!435021 (= e!257000 tp_is_empty!11413)))

(declare-fun res!256315 () Bool)

(declare-fun e!257005 () Bool)

(assert (=> start!39980 (=> (not res!256315) (not e!257005))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26649 0))(
  ( (array!26650 (arr!12774 (Array (_ BitVec 32) (_ BitVec 64))) (size!13127 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26649)

(assert (=> start!39980 (= res!256315 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13127 _keys!709))))))

(assert (=> start!39980 e!257005))

(assert (=> start!39980 tp_is_empty!11413))

(assert (=> start!39980 tp!36312))

(assert (=> start!39980 true))

(declare-datatypes ((V!16323 0))(
  ( (V!16324 (val!5751 Int)) )
))
(declare-datatypes ((ValueCell!5363 0))(
  ( (ValueCellFull!5363 (v!7992 V!16323)) (EmptyCell!5363) )
))
(declare-datatypes ((array!26651 0))(
  ( (array!26652 (arr!12775 (Array (_ BitVec 32) ValueCell!5363)) (size!13128 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26651)

(declare-fun e!257003 () Bool)

(declare-fun array_inv!9322 (array!26651) Bool)

(assert (=> start!39980 (and (array_inv!9322 _values!549) e!257003)))

(declare-fun array_inv!9323 (array!26649) Bool)

(assert (=> start!39980 (array_inv!9323 _keys!709)))

(declare-fun b!435022 () Bool)

(declare-fun e!256998 () Bool)

(assert (=> b!435022 (= e!256998 true)))

(declare-datatypes ((tuple2!7624 0))(
  ( (tuple2!7625 (_1!3823 (_ BitVec 64)) (_2!3823 V!16323)) )
))
(declare-datatypes ((List!7611 0))(
  ( (Nil!7608) (Cons!7607 (h!8463 tuple2!7624) (t!13312 List!7611)) )
))
(declare-datatypes ((ListLongMap!6527 0))(
  ( (ListLongMap!6528 (toList!3279 List!7611)) )
))
(declare-fun lt!200147 () ListLongMap!6527)

(declare-fun lt!200144 () ListLongMap!6527)

(declare-fun lt!200154 () tuple2!7624)

(declare-fun lt!200143 () tuple2!7624)

(declare-fun +!1454 (ListLongMap!6527 tuple2!7624) ListLongMap!6527)

(assert (=> b!435022 (= lt!200144 (+!1454 (+!1454 lt!200147 lt!200154) lt!200143))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!200152 () V!16323)

(declare-fun v!412 () V!16323)

(declare-datatypes ((Unit!12892 0))(
  ( (Unit!12893) )
))
(declare-fun lt!200142 () Unit!12892)

(declare-fun addCommutativeForDiffKeys!405 (ListLongMap!6527 (_ BitVec 64) V!16323 (_ BitVec 64) V!16323) Unit!12892)

(assert (=> b!435022 (= lt!200142 (addCommutativeForDiffKeys!405 lt!200147 k0!794 v!412 (select (arr!12774 _keys!709) from!863) lt!200152))))

(declare-fun b!435023 () Bool)

(declare-fun res!256322 () Bool)

(assert (=> b!435023 (=> (not res!256322) (not e!257005))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435023 (= res!256322 (validMask!0 mask!1025))))

(declare-fun b!435024 () Bool)

(declare-fun res!256318 () Bool)

(assert (=> b!435024 (=> (not res!256318) (not e!257005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435024 (= res!256318 (validKeyInArray!0 k0!794))))

(declare-fun b!435025 () Bool)

(declare-fun e!257002 () Bool)

(declare-fun e!257004 () Bool)

(assert (=> b!435025 (= e!257002 (not e!257004))))

(declare-fun res!256324 () Bool)

(assert (=> b!435025 (=> res!256324 e!257004)))

(assert (=> b!435025 (= res!256324 (not (validKeyInArray!0 (select (arr!12774 _keys!709) from!863))))))

(declare-fun lt!200156 () ListLongMap!6527)

(declare-fun lt!200148 () ListLongMap!6527)

(assert (=> b!435025 (= lt!200156 lt!200148)))

(assert (=> b!435025 (= lt!200148 (+!1454 lt!200147 lt!200143))))

(declare-fun minValue!515 () V!16323)

(declare-fun lt!200151 () array!26651)

(declare-fun zeroValue!515 () V!16323)

(declare-fun lt!200155 () array!26649)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1479 (array!26649 array!26651 (_ BitVec 32) (_ BitVec 32) V!16323 V!16323 (_ BitVec 32) Int) ListLongMap!6527)

(assert (=> b!435025 (= lt!200156 (getCurrentListMapNoExtraKeys!1479 lt!200155 lt!200151 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!435025 (= lt!200143 (tuple2!7625 k0!794 v!412))))

(assert (=> b!435025 (= lt!200147 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200153 () Unit!12892)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 (array!26649 array!26651 (_ BitVec 32) (_ BitVec 32) V!16323 V!16323 (_ BitVec 32) (_ BitVec 64) V!16323 (_ BitVec 32) Int) Unit!12892)

(assert (=> b!435025 (= lt!200153 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!598 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435026 () Bool)

(declare-fun res!256321 () Bool)

(assert (=> b!435026 (=> (not res!256321) (not e!257005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26649 (_ BitVec 32)) Bool)

(assert (=> b!435026 (= res!256321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435027 () Bool)

(declare-fun res!256312 () Bool)

(assert (=> b!435027 (=> (not res!256312) (not e!257005))))

(assert (=> b!435027 (= res!256312 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13127 _keys!709))))))

(declare-fun b!435028 () Bool)

(declare-fun res!256314 () Bool)

(assert (=> b!435028 (=> (not res!256314) (not e!257005))))

(declare-datatypes ((List!7612 0))(
  ( (Nil!7609) (Cons!7608 (h!8464 (_ BitVec 64)) (t!13313 List!7612)) )
))
(declare-fun arrayNoDuplicates!0 (array!26649 (_ BitVec 32) List!7612) Bool)

(assert (=> b!435028 (= res!256314 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7609))))

(declare-fun b!435029 () Bool)

(declare-fun res!256317 () Bool)

(assert (=> b!435029 (=> (not res!256317) (not e!257005))))

(assert (=> b!435029 (= res!256317 (or (= (select (arr!12774 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12774 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435030 () Bool)

(declare-fun e!257006 () Bool)

(assert (=> b!435030 (= e!257005 e!257006)))

(declare-fun res!256313 () Bool)

(assert (=> b!435030 (=> (not res!256313) (not e!257006))))

(assert (=> b!435030 (= res!256313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200155 mask!1025))))

(assert (=> b!435030 (= lt!200155 (array!26650 (store (arr!12774 _keys!709) i!563 k0!794) (size!13127 _keys!709)))))

(declare-fun b!435031 () Bool)

(declare-fun res!256319 () Bool)

(assert (=> b!435031 (=> (not res!256319) (not e!257005))))

(assert (=> b!435031 (= res!256319 (and (= (size!13128 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13127 _keys!709) (size!13128 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435032 () Bool)

(declare-fun mapRes!18741 () Bool)

(assert (=> b!435032 (= e!257003 (and e!257000 mapRes!18741))))

(declare-fun condMapEmpty!18741 () Bool)

(declare-fun mapDefault!18741 () ValueCell!5363)

(assert (=> b!435032 (= condMapEmpty!18741 (= (arr!12775 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5363)) mapDefault!18741)))))

(declare-fun b!435033 () Bool)

(declare-fun e!257007 () Unit!12892)

(declare-fun Unit!12894 () Unit!12892)

(assert (=> b!435033 (= e!257007 Unit!12894)))

(declare-fun b!435034 () Bool)

(declare-fun res!256320 () Bool)

(assert (=> b!435034 (=> (not res!256320) (not e!257006))))

(assert (=> b!435034 (= res!256320 (arrayNoDuplicates!0 lt!200155 #b00000000000000000000000000000000 Nil!7609))))

(declare-fun b!435035 () Bool)

(assert (=> b!435035 (= e!257004 e!256998)))

(declare-fun res!256323 () Bool)

(assert (=> b!435035 (=> res!256323 e!256998)))

(assert (=> b!435035 (= res!256323 (= k0!794 (select (arr!12774 _keys!709) from!863)))))

(assert (=> b!435035 (not (= (select (arr!12774 _keys!709) from!863) k0!794))))

(declare-fun lt!200149 () Unit!12892)

(assert (=> b!435035 (= lt!200149 e!257007)))

(declare-fun c!55656 () Bool)

(assert (=> b!435035 (= c!55656 (= (select (arr!12774 _keys!709) from!863) k0!794))))

(declare-fun lt!200145 () ListLongMap!6527)

(assert (=> b!435035 (= lt!200145 lt!200144)))

(assert (=> b!435035 (= lt!200144 (+!1454 lt!200148 lt!200154))))

(assert (=> b!435035 (= lt!200154 (tuple2!7625 (select (arr!12774 _keys!709) from!863) lt!200152))))

(declare-fun get!6370 (ValueCell!5363 V!16323) V!16323)

(declare-fun dynLambda!832 (Int (_ BitVec 64)) V!16323)

(assert (=> b!435035 (= lt!200152 (get!6370 (select (arr!12775 _values!549) from!863) (dynLambda!832 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18741 () Bool)

(assert (=> mapIsEmpty!18741 mapRes!18741))

(declare-fun b!435036 () Bool)

(declare-fun Unit!12895 () Unit!12892)

(assert (=> b!435036 (= e!257007 Unit!12895)))

(declare-fun lt!200150 () Unit!12892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26649 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12892)

(assert (=> b!435036 (= lt!200150 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435036 false))

(declare-fun b!435037 () Bool)

(assert (=> b!435037 (= e!257006 e!257002)))

(declare-fun res!256326 () Bool)

(assert (=> b!435037 (=> (not res!256326) (not e!257002))))

(assert (=> b!435037 (= res!256326 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!435037 (= lt!200145 (getCurrentListMapNoExtraKeys!1479 lt!200155 lt!200151 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435037 (= lt!200151 (array!26652 (store (arr!12775 _values!549) i!563 (ValueCellFull!5363 v!412)) (size!13128 _values!549)))))

(declare-fun lt!200146 () ListLongMap!6527)

(assert (=> b!435037 (= lt!200146 (getCurrentListMapNoExtraKeys!1479 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435038 () Bool)

(declare-fun e!256999 () Bool)

(assert (=> b!435038 (= e!256999 tp_is_empty!11413)))

(declare-fun b!435039 () Bool)

(declare-fun res!256325 () Bool)

(assert (=> b!435039 (=> (not res!256325) (not e!257005))))

(declare-fun arrayContainsKey!0 (array!26649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435039 (= res!256325 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18741 () Bool)

(declare-fun tp!36311 () Bool)

(assert (=> mapNonEmpty!18741 (= mapRes!18741 (and tp!36311 e!256999))))

(declare-fun mapRest!18741 () (Array (_ BitVec 32) ValueCell!5363))

(declare-fun mapKey!18741 () (_ BitVec 32))

(declare-fun mapValue!18741 () ValueCell!5363)

(assert (=> mapNonEmpty!18741 (= (arr!12775 _values!549) (store mapRest!18741 mapKey!18741 mapValue!18741))))

(declare-fun b!435040 () Bool)

(declare-fun res!256316 () Bool)

(assert (=> b!435040 (=> (not res!256316) (not e!257006))))

(assert (=> b!435040 (= res!256316 (bvsle from!863 i!563))))

(assert (= (and start!39980 res!256315) b!435023))

(assert (= (and b!435023 res!256322) b!435031))

(assert (= (and b!435031 res!256319) b!435026))

(assert (= (and b!435026 res!256321) b!435028))

(assert (= (and b!435028 res!256314) b!435027))

(assert (= (and b!435027 res!256312) b!435024))

(assert (= (and b!435024 res!256318) b!435029))

(assert (= (and b!435029 res!256317) b!435039))

(assert (= (and b!435039 res!256325) b!435030))

(assert (= (and b!435030 res!256313) b!435034))

(assert (= (and b!435034 res!256320) b!435040))

(assert (= (and b!435040 res!256316) b!435037))

(assert (= (and b!435037 res!256326) b!435025))

(assert (= (and b!435025 (not res!256324)) b!435035))

(assert (= (and b!435035 c!55656) b!435036))

(assert (= (and b!435035 (not c!55656)) b!435033))

(assert (= (and b!435035 (not res!256323)) b!435022))

(assert (= (and b!435032 condMapEmpty!18741) mapIsEmpty!18741))

(assert (= (and b!435032 (not condMapEmpty!18741)) mapNonEmpty!18741))

(get-info :version)

(assert (= (and mapNonEmpty!18741 ((_ is ValueCellFull!5363) mapValue!18741)) b!435038))

(assert (= (and b!435032 ((_ is ValueCellFull!5363) mapDefault!18741)) b!435021))

(assert (= start!39980 b!435032))

(declare-fun b_lambda!9331 () Bool)

(assert (=> (not b_lambda!9331) (not b!435035)))

(declare-fun t!13311 () Bool)

(declare-fun tb!3659 () Bool)

(assert (=> (and start!39980 (= defaultEntry!557 defaultEntry!557) t!13311) tb!3659))

(declare-fun result!6853 () Bool)

(assert (=> tb!3659 (= result!6853 tp_is_empty!11413)))

(assert (=> b!435035 t!13311))

(declare-fun b_and!18157 () Bool)

(assert (= b_and!18155 (and (=> t!13311 result!6853) b_and!18157)))

(declare-fun m!422457 () Bool)

(assert (=> b!435026 m!422457))

(declare-fun m!422459 () Bool)

(assert (=> b!435028 m!422459))

(declare-fun m!422461 () Bool)

(assert (=> b!435022 m!422461))

(assert (=> b!435022 m!422461))

(declare-fun m!422463 () Bool)

(assert (=> b!435022 m!422463))

(declare-fun m!422465 () Bool)

(assert (=> b!435022 m!422465))

(assert (=> b!435022 m!422465))

(declare-fun m!422467 () Bool)

(assert (=> b!435022 m!422467))

(declare-fun m!422469 () Bool)

(assert (=> mapNonEmpty!18741 m!422469))

(declare-fun m!422471 () Bool)

(assert (=> b!435024 m!422471))

(declare-fun m!422473 () Bool)

(assert (=> b!435034 m!422473))

(declare-fun m!422475 () Bool)

(assert (=> b!435023 m!422475))

(declare-fun m!422477 () Bool)

(assert (=> b!435036 m!422477))

(assert (=> b!435035 m!422465))

(declare-fun m!422479 () Bool)

(assert (=> b!435035 m!422479))

(declare-fun m!422481 () Bool)

(assert (=> b!435035 m!422481))

(declare-fun m!422483 () Bool)

(assert (=> b!435035 m!422483))

(assert (=> b!435035 m!422483))

(assert (=> b!435035 m!422479))

(declare-fun m!422485 () Bool)

(assert (=> b!435035 m!422485))

(declare-fun m!422487 () Bool)

(assert (=> start!39980 m!422487))

(declare-fun m!422489 () Bool)

(assert (=> start!39980 m!422489))

(declare-fun m!422491 () Bool)

(assert (=> b!435037 m!422491))

(declare-fun m!422493 () Bool)

(assert (=> b!435037 m!422493))

(declare-fun m!422495 () Bool)

(assert (=> b!435037 m!422495))

(declare-fun m!422497 () Bool)

(assert (=> b!435029 m!422497))

(declare-fun m!422499 () Bool)

(assert (=> b!435039 m!422499))

(declare-fun m!422501 () Bool)

(assert (=> b!435030 m!422501))

(declare-fun m!422503 () Bool)

(assert (=> b!435030 m!422503))

(assert (=> b!435025 m!422465))

(declare-fun m!422505 () Bool)

(assert (=> b!435025 m!422505))

(assert (=> b!435025 m!422465))

(declare-fun m!422507 () Bool)

(assert (=> b!435025 m!422507))

(declare-fun m!422509 () Bool)

(assert (=> b!435025 m!422509))

(declare-fun m!422511 () Bool)

(assert (=> b!435025 m!422511))

(declare-fun m!422513 () Bool)

(assert (=> b!435025 m!422513))

(check-sat (not b!435022) (not start!39980) (not b!435036) (not b_next!10261) tp_is_empty!11413 (not b_lambda!9331) (not b!435028) (not b!435026) (not b!435035) (not b!435025) (not b!435039) (not b!435037) (not b!435034) (not mapNonEmpty!18741) b_and!18157 (not b!435030) (not b!435024) (not b!435023))
(check-sat b_and!18157 (not b_next!10261))
