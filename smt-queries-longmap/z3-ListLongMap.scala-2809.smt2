; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40750 () Bool)

(assert start!40750)

(declare-fun b_free!10753 () Bool)

(declare-fun b_next!10753 () Bool)

(assert (=> start!40750 (= b_free!10753 (not b_next!10753))))

(declare-fun tp!38081 () Bool)

(declare-fun b_and!18767 () Bool)

(assert (=> start!40750 (= tp!38081 b_and!18767)))

(declare-fun b!451315 () Bool)

(declare-fun e!264353 () Bool)

(declare-fun e!264351 () Bool)

(assert (=> b!451315 (= e!264353 (not e!264351))))

(declare-fun res!268760 () Bool)

(assert (=> b!451315 (=> res!268760 e!264351)))

(declare-datatypes ((array!27981 0))(
  ( (array!27982 (arr!13435 (Array (_ BitVec 32) (_ BitVec 64))) (size!13788 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27981)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451315 (= res!268760 (validKeyInArray!0 (select (arr!13435 _keys!709) from!863)))))

(declare-fun e!264350 () Bool)

(assert (=> b!451315 e!264350))

(declare-fun c!56007 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451315 (= c!56007 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17227 0))(
  ( (V!17228 (val!6090 Int)) )
))
(declare-fun minValue!515 () V!17227)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!13171 0))(
  ( (Unit!13172) )
))
(declare-fun lt!204730 () Unit!13171)

(declare-datatypes ((ValueCell!5702 0))(
  ( (ValueCellFull!5702 (v!8343 V!17227)) (EmptyCell!5702) )
))
(declare-datatypes ((array!27983 0))(
  ( (array!27984 (arr!13436 (Array (_ BitVec 32) ValueCell!5702)) (size!13789 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27983)

(declare-fun zeroValue!515 () V!17227)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17227)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 (array!27981 array!27983 (_ BitVec 32) (_ BitVec 32) V!17227 V!17227 (_ BitVec 32) (_ BitVec 64) V!17227 (_ BitVec 32) Int) Unit!13171)

(assert (=> b!451315 (= lt!204730 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!713 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451316 () Bool)

(declare-fun e!264352 () Bool)

(declare-fun tp_is_empty!12091 () Bool)

(assert (=> b!451316 (= e!264352 tp_is_empty!12091)))

(declare-fun mapNonEmpty!19773 () Bool)

(declare-fun mapRes!19773 () Bool)

(declare-fun tp!38082 () Bool)

(declare-fun e!264346 () Bool)

(assert (=> mapNonEmpty!19773 (= mapRes!19773 (and tp!38082 e!264346))))

(declare-fun mapKey!19773 () (_ BitVec 32))

(declare-fun mapRest!19773 () (Array (_ BitVec 32) ValueCell!5702))

(declare-fun mapValue!19773 () ValueCell!5702)

(assert (=> mapNonEmpty!19773 (= (arr!13436 _values!549) (store mapRest!19773 mapKey!19773 mapValue!19773))))

(declare-fun b!451317 () Bool)

(declare-fun e!264349 () Bool)

(assert (=> b!451317 (= e!264349 e!264353)))

(declare-fun res!268759 () Bool)

(assert (=> b!451317 (=> (not res!268759) (not e!264353))))

(assert (=> b!451317 (= res!268759 (= from!863 i!563))))

(declare-fun lt!204731 () array!27981)

(declare-datatypes ((tuple2!8016 0))(
  ( (tuple2!8017 (_1!4019 (_ BitVec 64)) (_2!4019 V!17227)) )
))
(declare-datatypes ((List!8079 0))(
  ( (Nil!8076) (Cons!8075 (h!8931 tuple2!8016) (t!13846 List!8079)) )
))
(declare-datatypes ((ListLongMap!6919 0))(
  ( (ListLongMap!6920 (toList!3475 List!8079)) )
))
(declare-fun lt!204733 () ListLongMap!6919)

(declare-fun lt!204732 () array!27983)

(declare-fun getCurrentListMapNoExtraKeys!1672 (array!27981 array!27983 (_ BitVec 32) (_ BitVec 32) V!17227 V!17227 (_ BitVec 32) Int) ListLongMap!6919)

(assert (=> b!451317 (= lt!204733 (getCurrentListMapNoExtraKeys!1672 lt!204731 lt!204732 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451317 (= lt!204732 (array!27984 (store (arr!13436 _values!549) i!563 (ValueCellFull!5702 v!412)) (size!13789 _values!549)))))

(declare-fun lt!204734 () ListLongMap!6919)

(assert (=> b!451317 (= lt!204734 (getCurrentListMapNoExtraKeys!1672 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451318 () Bool)

(assert (=> b!451318 (= e!264351 true)))

(declare-fun +!1576 (ListLongMap!6919 tuple2!8016) ListLongMap!6919)

(declare-fun get!6619 (ValueCell!5702 V!17227) V!17227)

(declare-fun dynLambda!853 (Int (_ BitVec 64)) V!17227)

(assert (=> b!451318 (= lt!204733 (+!1576 (getCurrentListMapNoExtraKeys!1672 lt!204731 lt!204732 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8017 (select (arr!13435 lt!204731) from!863) (get!6619 (select (arr!13436 lt!204732) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451319 () Bool)

(declare-fun res!268751 () Bool)

(assert (=> b!451319 (=> (not res!268751) (not e!264349))))

(declare-datatypes ((List!8080 0))(
  ( (Nil!8077) (Cons!8076 (h!8932 (_ BitVec 64)) (t!13847 List!8080)) )
))
(declare-fun arrayNoDuplicates!0 (array!27981 (_ BitVec 32) List!8080) Bool)

(assert (=> b!451319 (= res!268751 (arrayNoDuplicates!0 lt!204731 #b00000000000000000000000000000000 Nil!8077))))

(declare-fun res!268747 () Bool)

(declare-fun e!264345 () Bool)

(assert (=> start!40750 (=> (not res!268747) (not e!264345))))

(assert (=> start!40750 (= res!268747 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13788 _keys!709))))))

(assert (=> start!40750 e!264345))

(assert (=> start!40750 tp_is_empty!12091))

(assert (=> start!40750 tp!38081))

(assert (=> start!40750 true))

(declare-fun e!264347 () Bool)

(declare-fun array_inv!9792 (array!27983) Bool)

(assert (=> start!40750 (and (array_inv!9792 _values!549) e!264347)))

(declare-fun array_inv!9793 (array!27981) Bool)

(assert (=> start!40750 (array_inv!9793 _keys!709)))

(declare-fun call!29847 () ListLongMap!6919)

(declare-fun b!451320 () Bool)

(declare-fun call!29848 () ListLongMap!6919)

(assert (=> b!451320 (= e!264350 (= call!29848 (+!1576 call!29847 (tuple2!8017 k0!794 v!412))))))

(declare-fun b!451321 () Bool)

(declare-fun res!268753 () Bool)

(assert (=> b!451321 (=> (not res!268753) (not e!264345))))

(assert (=> b!451321 (= res!268753 (or (= (select (arr!13435 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13435 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451322 () Bool)

(declare-fun res!268756 () Bool)

(assert (=> b!451322 (=> (not res!268756) (not e!264345))))

(assert (=> b!451322 (= res!268756 (validKeyInArray!0 k0!794))))

(declare-fun b!451323 () Bool)

(assert (=> b!451323 (= e!264346 tp_is_empty!12091)))

(declare-fun b!451324 () Bool)

(declare-fun res!268754 () Bool)

(assert (=> b!451324 (=> (not res!268754) (not e!264345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451324 (= res!268754 (validMask!0 mask!1025))))

(declare-fun b!451325 () Bool)

(assert (=> b!451325 (= e!264345 e!264349)))

(declare-fun res!268755 () Bool)

(assert (=> b!451325 (=> (not res!268755) (not e!264349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27981 (_ BitVec 32)) Bool)

(assert (=> b!451325 (= res!268755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204731 mask!1025))))

(assert (=> b!451325 (= lt!204731 (array!27982 (store (arr!13435 _keys!709) i!563 k0!794) (size!13788 _keys!709)))))

(declare-fun bm!29844 () Bool)

(assert (=> bm!29844 (= call!29848 (getCurrentListMapNoExtraKeys!1672 (ite c!56007 lt!204731 _keys!709) (ite c!56007 lt!204732 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451326 () Bool)

(declare-fun res!268750 () Bool)

(assert (=> b!451326 (=> (not res!268750) (not e!264345))))

(assert (=> b!451326 (= res!268750 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13788 _keys!709))))))

(declare-fun b!451327 () Bool)

(declare-fun res!268749 () Bool)

(assert (=> b!451327 (=> (not res!268749) (not e!264345))))

(assert (=> b!451327 (= res!268749 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8077))))

(declare-fun b!451328 () Bool)

(declare-fun res!268758 () Bool)

(assert (=> b!451328 (=> (not res!268758) (not e!264345))))

(declare-fun arrayContainsKey!0 (array!27981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451328 (= res!268758 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451329 () Bool)

(declare-fun res!268752 () Bool)

(assert (=> b!451329 (=> (not res!268752) (not e!264345))))

(assert (=> b!451329 (= res!268752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451330 () Bool)

(assert (=> b!451330 (= e!264350 (= call!29847 call!29848))))

(declare-fun b!451331 () Bool)

(declare-fun res!268757 () Bool)

(assert (=> b!451331 (=> (not res!268757) (not e!264345))))

(assert (=> b!451331 (= res!268757 (and (= (size!13789 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13788 _keys!709) (size!13789 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19773 () Bool)

(assert (=> mapIsEmpty!19773 mapRes!19773))

(declare-fun b!451332 () Bool)

(assert (=> b!451332 (= e!264347 (and e!264352 mapRes!19773))))

(declare-fun condMapEmpty!19773 () Bool)

(declare-fun mapDefault!19773 () ValueCell!5702)

(assert (=> b!451332 (= condMapEmpty!19773 (= (arr!13436 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5702)) mapDefault!19773)))))

(declare-fun b!451333 () Bool)

(declare-fun res!268748 () Bool)

(assert (=> b!451333 (=> (not res!268748) (not e!264349))))

(assert (=> b!451333 (= res!268748 (bvsle from!863 i!563))))

(declare-fun bm!29845 () Bool)

(assert (=> bm!29845 (= call!29847 (getCurrentListMapNoExtraKeys!1672 (ite c!56007 _keys!709 lt!204731) (ite c!56007 _values!549 lt!204732) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40750 res!268747) b!451324))

(assert (= (and b!451324 res!268754) b!451331))

(assert (= (and b!451331 res!268757) b!451329))

(assert (= (and b!451329 res!268752) b!451327))

(assert (= (and b!451327 res!268749) b!451326))

(assert (= (and b!451326 res!268750) b!451322))

(assert (= (and b!451322 res!268756) b!451321))

(assert (= (and b!451321 res!268753) b!451328))

(assert (= (and b!451328 res!268758) b!451325))

(assert (= (and b!451325 res!268755) b!451319))

(assert (= (and b!451319 res!268751) b!451333))

(assert (= (and b!451333 res!268748) b!451317))

(assert (= (and b!451317 res!268759) b!451315))

(assert (= (and b!451315 c!56007) b!451320))

(assert (= (and b!451315 (not c!56007)) b!451330))

(assert (= (or b!451320 b!451330) bm!29844))

(assert (= (or b!451320 b!451330) bm!29845))

(assert (= (and b!451315 (not res!268760)) b!451318))

(assert (= (and b!451332 condMapEmpty!19773) mapIsEmpty!19773))

(assert (= (and b!451332 (not condMapEmpty!19773)) mapNonEmpty!19773))

(get-info :version)

(assert (= (and mapNonEmpty!19773 ((_ is ValueCellFull!5702) mapValue!19773)) b!451323))

(assert (= (and b!451332 ((_ is ValueCellFull!5702) mapDefault!19773)) b!451316))

(assert (= start!40750 b!451332))

(declare-fun b_lambda!9513 () Bool)

(assert (=> (not b_lambda!9513) (not b!451318)))

(declare-fun t!13845 () Bool)

(declare-fun tb!3725 () Bool)

(assert (=> (and start!40750 (= defaultEntry!557 defaultEntry!557) t!13845) tb!3725))

(declare-fun result!6995 () Bool)

(assert (=> tb!3725 (= result!6995 tp_is_empty!12091)))

(assert (=> b!451318 t!13845))

(declare-fun b_and!18769 () Bool)

(assert (= b_and!18767 (and (=> t!13845 result!6995) b_and!18769)))

(declare-fun m!434615 () Bool)

(assert (=> b!451318 m!434615))

(declare-fun m!434617 () Bool)

(assert (=> b!451318 m!434617))

(declare-fun m!434619 () Bool)

(assert (=> b!451318 m!434619))

(declare-fun m!434621 () Bool)

(assert (=> b!451318 m!434621))

(declare-fun m!434623 () Bool)

(assert (=> b!451318 m!434623))

(declare-fun m!434625 () Bool)

(assert (=> b!451318 m!434625))

(assert (=> b!451318 m!434619))

(assert (=> b!451318 m!434623))

(assert (=> b!451318 m!434617))

(declare-fun m!434627 () Bool)

(assert (=> b!451319 m!434627))

(declare-fun m!434629 () Bool)

(assert (=> b!451324 m!434629))

(declare-fun m!434631 () Bool)

(assert (=> b!451327 m!434631))

(declare-fun m!434633 () Bool)

(assert (=> b!451325 m!434633))

(declare-fun m!434635 () Bool)

(assert (=> b!451325 m!434635))

(declare-fun m!434637 () Bool)

(assert (=> b!451322 m!434637))

(declare-fun m!434639 () Bool)

(assert (=> mapNonEmpty!19773 m!434639))

(declare-fun m!434641 () Bool)

(assert (=> b!451321 m!434641))

(declare-fun m!434643 () Bool)

(assert (=> bm!29845 m!434643))

(declare-fun m!434645 () Bool)

(assert (=> b!451320 m!434645))

(declare-fun m!434647 () Bool)

(assert (=> b!451329 m!434647))

(declare-fun m!434649 () Bool)

(assert (=> start!40750 m!434649))

(declare-fun m!434651 () Bool)

(assert (=> start!40750 m!434651))

(declare-fun m!434653 () Bool)

(assert (=> bm!29844 m!434653))

(declare-fun m!434655 () Bool)

(assert (=> b!451317 m!434655))

(declare-fun m!434657 () Bool)

(assert (=> b!451317 m!434657))

(declare-fun m!434659 () Bool)

(assert (=> b!451317 m!434659))

(declare-fun m!434661 () Bool)

(assert (=> b!451315 m!434661))

(assert (=> b!451315 m!434661))

(declare-fun m!434663 () Bool)

(assert (=> b!451315 m!434663))

(declare-fun m!434665 () Bool)

(assert (=> b!451315 m!434665))

(declare-fun m!434667 () Bool)

(assert (=> b!451328 m!434667))

(check-sat tp_is_empty!12091 (not b!451322) (not mapNonEmpty!19773) (not b!451317) (not start!40750) (not b!451324) (not b_next!10753) (not b!451327) (not bm!29844) (not b!451319) (not b!451329) (not b!451315) (not b!451320) (not b_lambda!9513) (not b!451318) (not b!451328) b_and!18769 (not bm!29845) (not b!451325))
(check-sat b_and!18769 (not b_next!10753))
