; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41128 () Bool)

(assert start!41128)

(declare-fun b_free!11011 () Bool)

(declare-fun b_next!11011 () Bool)

(assert (=> start!41128 (= b_free!11011 (not b_next!11011))))

(declare-fun tp!38869 () Bool)

(declare-fun b_and!19271 () Bool)

(assert (=> start!41128 (= tp!38869 b_and!19271)))

(declare-fun b!459104 () Bool)

(declare-fun e!267990 () Bool)

(declare-fun e!267993 () Bool)

(assert (=> b!459104 (= e!267990 (not e!267993))))

(declare-fun res!274371 () Bool)

(assert (=> b!459104 (=> res!274371 e!267993)))

(declare-datatypes ((array!28492 0))(
  ( (array!28493 (arr!13686 (Array (_ BitVec 32) (_ BitVec 64))) (size!14038 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28492)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459104 (= res!274371 (not (validKeyInArray!0 (select (arr!13686 _keys!709) from!863))))))

(declare-datatypes ((V!17571 0))(
  ( (V!17572 (val!6219 Int)) )
))
(declare-datatypes ((tuple2!8116 0))(
  ( (tuple2!8117 (_1!4069 (_ BitVec 64)) (_2!4069 V!17571)) )
))
(declare-datatypes ((List!8186 0))(
  ( (Nil!8183) (Cons!8182 (h!9038 tuple2!8116) (t!14068 List!8186)) )
))
(declare-datatypes ((ListLongMap!7031 0))(
  ( (ListLongMap!7032 (toList!3531 List!8186)) )
))
(declare-fun lt!207734 () ListLongMap!7031)

(declare-fun lt!207740 () ListLongMap!7031)

(assert (=> b!459104 (= lt!207734 lt!207740)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!207741 () ListLongMap!7031)

(declare-fun v!412 () V!17571)

(declare-fun +!1610 (ListLongMap!7031 tuple2!8116) ListLongMap!7031)

(assert (=> b!459104 (= lt!207740 (+!1610 lt!207741 (tuple2!8117 k0!794 v!412)))))

(declare-fun minValue!515 () V!17571)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5831 0))(
  ( (ValueCellFull!5831 (v!8498 V!17571)) (EmptyCell!5831) )
))
(declare-datatypes ((array!28494 0))(
  ( (array!28495 (arr!13687 (Array (_ BitVec 32) ValueCell!5831)) (size!14039 (_ BitVec 32))) )
))
(declare-fun lt!207737 () array!28494)

(declare-fun lt!207742 () array!28492)

(declare-fun zeroValue!515 () V!17571)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1760 (array!28492 array!28494 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) Int) ListLongMap!7031)

(assert (=> b!459104 (= lt!207734 (getCurrentListMapNoExtraKeys!1760 lt!207742 lt!207737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28494)

(assert (=> b!459104 (= lt!207741 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13324 0))(
  ( (Unit!13325) )
))
(declare-fun lt!207738 () Unit!13324)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 (array!28492 array!28494 (_ BitVec 32) (_ BitVec 32) V!17571 V!17571 (_ BitVec 32) (_ BitVec 64) V!17571 (_ BitVec 32) Int) Unit!13324)

(assert (=> b!459104 (= lt!207738 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459105 () Bool)

(declare-fun e!267989 () Unit!13324)

(declare-fun Unit!13326 () Unit!13324)

(assert (=> b!459105 (= e!267989 Unit!13326)))

(declare-fun lt!207739 () Unit!13324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13324)

(assert (=> b!459105 (= lt!207739 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459105 false))

(declare-fun b!459106 () Bool)

(declare-fun res!274365 () Bool)

(declare-fun e!267988 () Bool)

(assert (=> b!459106 (=> (not res!274365) (not e!267988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28492 (_ BitVec 32)) Bool)

(assert (=> b!459106 (= res!274365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459107 () Bool)

(declare-fun res!274367 () Bool)

(assert (=> b!459107 (=> (not res!274367) (not e!267988))))

(declare-datatypes ((List!8187 0))(
  ( (Nil!8184) (Cons!8183 (h!9039 (_ BitVec 64)) (t!14069 List!8187)) )
))
(declare-fun arrayNoDuplicates!0 (array!28492 (_ BitVec 32) List!8187) Bool)

(assert (=> b!459107 (= res!274367 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8184))))

(declare-fun b!459108 () Bool)

(declare-fun res!274377 () Bool)

(assert (=> b!459108 (=> (not res!274377) (not e!267988))))

(assert (=> b!459108 (= res!274377 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14038 _keys!709))))))

(declare-fun b!459109 () Bool)

(declare-fun res!274376 () Bool)

(assert (=> b!459109 (=> (not res!274376) (not e!267988))))

(assert (=> b!459109 (= res!274376 (or (= (select (arr!13686 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13686 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459110 () Bool)

(declare-fun res!274374 () Bool)

(declare-fun e!267991 () Bool)

(assert (=> b!459110 (=> (not res!274374) (not e!267991))))

(assert (=> b!459110 (= res!274374 (bvsle from!863 i!563))))

(declare-fun b!459111 () Bool)

(declare-fun res!274369 () Bool)

(assert (=> b!459111 (=> (not res!274369) (not e!267991))))

(assert (=> b!459111 (= res!274369 (arrayNoDuplicates!0 lt!207742 #b00000000000000000000000000000000 Nil!8184))))

(declare-fun b!459112 () Bool)

(declare-fun e!267985 () Bool)

(declare-fun e!267986 () Bool)

(declare-fun mapRes!20173 () Bool)

(assert (=> b!459112 (= e!267985 (and e!267986 mapRes!20173))))

(declare-fun condMapEmpty!20173 () Bool)

(declare-fun mapDefault!20173 () ValueCell!5831)

(assert (=> b!459112 (= condMapEmpty!20173 (= (arr!13687 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5831)) mapDefault!20173)))))

(declare-fun b!459113 () Bool)

(declare-fun res!274364 () Bool)

(assert (=> b!459113 (=> (not res!274364) (not e!267988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459113 (= res!274364 (validMask!0 mask!1025))))

(declare-fun b!459114 () Bool)

(declare-fun res!274368 () Bool)

(assert (=> b!459114 (=> (not res!274368) (not e!267988))))

(declare-fun arrayContainsKey!0 (array!28492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459114 (= res!274368 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459115 () Bool)

(declare-fun e!267992 () Bool)

(declare-fun tp_is_empty!12349 () Bool)

(assert (=> b!459115 (= e!267992 tp_is_empty!12349)))

(declare-fun b!459117 () Bool)

(declare-fun res!274373 () Bool)

(assert (=> b!459117 (=> (not res!274373) (not e!267988))))

(assert (=> b!459117 (= res!274373 (validKeyInArray!0 k0!794))))

(declare-fun b!459118 () Bool)

(assert (=> b!459118 (= e!267991 e!267990)))

(declare-fun res!274372 () Bool)

(assert (=> b!459118 (=> (not res!274372) (not e!267990))))

(assert (=> b!459118 (= res!274372 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207735 () ListLongMap!7031)

(assert (=> b!459118 (= lt!207735 (getCurrentListMapNoExtraKeys!1760 lt!207742 lt!207737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459118 (= lt!207737 (array!28495 (store (arr!13687 _values!549) i!563 (ValueCellFull!5831 v!412)) (size!14039 _values!549)))))

(declare-fun lt!207743 () ListLongMap!7031)

(assert (=> b!459118 (= lt!207743 (getCurrentListMapNoExtraKeys!1760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459119 () Bool)

(assert (=> b!459119 (= e!267988 e!267991)))

(declare-fun res!274366 () Bool)

(assert (=> b!459119 (=> (not res!274366) (not e!267991))))

(assert (=> b!459119 (= res!274366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207742 mask!1025))))

(assert (=> b!459119 (= lt!207742 (array!28493 (store (arr!13686 _keys!709) i!563 k0!794) (size!14038 _keys!709)))))

(declare-fun b!459120 () Bool)

(assert (=> b!459120 (= e!267993 (not (= (select (arr!13686 _keys!709) from!863) k0!794)))))

(declare-fun lt!207736 () Unit!13324)

(assert (=> b!459120 (= lt!207736 e!267989)))

(declare-fun c!56438 () Bool)

(assert (=> b!459120 (= c!56438 (= (select (arr!13686 _keys!709) from!863) k0!794))))

(declare-fun get!6755 (ValueCell!5831 V!17571) V!17571)

(declare-fun dynLambda!891 (Int (_ BitVec 64)) V!17571)

(assert (=> b!459120 (= lt!207735 (+!1610 lt!207740 (tuple2!8117 (select (arr!13686 _keys!709) from!863) (get!6755 (select (arr!13687 _values!549) from!863) (dynLambda!891 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459116 () Bool)

(declare-fun res!274370 () Bool)

(assert (=> b!459116 (=> (not res!274370) (not e!267988))))

(assert (=> b!459116 (= res!274370 (and (= (size!14039 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14038 _keys!709) (size!14039 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!274375 () Bool)

(assert (=> start!41128 (=> (not res!274375) (not e!267988))))

(assert (=> start!41128 (= res!274375 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14038 _keys!709))))))

(assert (=> start!41128 e!267988))

(assert (=> start!41128 tp_is_empty!12349))

(assert (=> start!41128 tp!38869))

(assert (=> start!41128 true))

(declare-fun array_inv!9982 (array!28494) Bool)

(assert (=> start!41128 (and (array_inv!9982 _values!549) e!267985)))

(declare-fun array_inv!9983 (array!28492) Bool)

(assert (=> start!41128 (array_inv!9983 _keys!709)))

(declare-fun mapIsEmpty!20173 () Bool)

(assert (=> mapIsEmpty!20173 mapRes!20173))

(declare-fun b!459121 () Bool)

(assert (=> b!459121 (= e!267986 tp_is_empty!12349)))

(declare-fun b!459122 () Bool)

(declare-fun Unit!13327 () Unit!13324)

(assert (=> b!459122 (= e!267989 Unit!13327)))

(declare-fun mapNonEmpty!20173 () Bool)

(declare-fun tp!38868 () Bool)

(assert (=> mapNonEmpty!20173 (= mapRes!20173 (and tp!38868 e!267992))))

(declare-fun mapRest!20173 () (Array (_ BitVec 32) ValueCell!5831))

(declare-fun mapValue!20173 () ValueCell!5831)

(declare-fun mapKey!20173 () (_ BitVec 32))

(assert (=> mapNonEmpty!20173 (= (arr!13687 _values!549) (store mapRest!20173 mapKey!20173 mapValue!20173))))

(assert (= (and start!41128 res!274375) b!459113))

(assert (= (and b!459113 res!274364) b!459116))

(assert (= (and b!459116 res!274370) b!459106))

(assert (= (and b!459106 res!274365) b!459107))

(assert (= (and b!459107 res!274367) b!459108))

(assert (= (and b!459108 res!274377) b!459117))

(assert (= (and b!459117 res!274373) b!459109))

(assert (= (and b!459109 res!274376) b!459114))

(assert (= (and b!459114 res!274368) b!459119))

(assert (= (and b!459119 res!274366) b!459111))

(assert (= (and b!459111 res!274369) b!459110))

(assert (= (and b!459110 res!274374) b!459118))

(assert (= (and b!459118 res!274372) b!459104))

(assert (= (and b!459104 (not res!274371)) b!459120))

(assert (= (and b!459120 c!56438) b!459105))

(assert (= (and b!459120 (not c!56438)) b!459122))

(assert (= (and b!459112 condMapEmpty!20173) mapIsEmpty!20173))

(assert (= (and b!459112 (not condMapEmpty!20173)) mapNonEmpty!20173))

(get-info :version)

(assert (= (and mapNonEmpty!20173 ((_ is ValueCellFull!5831) mapValue!20173)) b!459115))

(assert (= (and b!459112 ((_ is ValueCellFull!5831) mapDefault!20173)) b!459121))

(assert (= start!41128 b!459112))

(declare-fun b_lambda!9859 () Bool)

(assert (=> (not b_lambda!9859) (not b!459120)))

(declare-fun t!14067 () Bool)

(declare-fun tb!3839 () Bool)

(assert (=> (and start!41128 (= defaultEntry!557 defaultEntry!557) t!14067) tb!3839))

(declare-fun result!7231 () Bool)

(assert (=> tb!3839 (= result!7231 tp_is_empty!12349)))

(assert (=> b!459120 t!14067))

(declare-fun b_and!19273 () Bool)

(assert (= b_and!19271 (and (=> t!14067 result!7231) b_and!19273)))

(declare-fun m!442661 () Bool)

(assert (=> b!459106 m!442661))

(declare-fun m!442663 () Bool)

(assert (=> b!459111 m!442663))

(declare-fun m!442665 () Bool)

(assert (=> b!459118 m!442665))

(declare-fun m!442667 () Bool)

(assert (=> b!459118 m!442667))

(declare-fun m!442669 () Bool)

(assert (=> b!459118 m!442669))

(declare-fun m!442671 () Bool)

(assert (=> b!459114 m!442671))

(declare-fun m!442673 () Bool)

(assert (=> start!41128 m!442673))

(declare-fun m!442675 () Bool)

(assert (=> start!41128 m!442675))

(declare-fun m!442677 () Bool)

(assert (=> b!459105 m!442677))

(declare-fun m!442679 () Bool)

(assert (=> b!459120 m!442679))

(declare-fun m!442681 () Bool)

(assert (=> b!459120 m!442681))

(declare-fun m!442683 () Bool)

(assert (=> b!459120 m!442683))

(declare-fun m!442685 () Bool)

(assert (=> b!459120 m!442685))

(assert (=> b!459120 m!442683))

(assert (=> b!459120 m!442681))

(declare-fun m!442687 () Bool)

(assert (=> b!459120 m!442687))

(declare-fun m!442689 () Bool)

(assert (=> mapNonEmpty!20173 m!442689))

(declare-fun m!442691 () Bool)

(assert (=> b!459109 m!442691))

(declare-fun m!442693 () Bool)

(assert (=> b!459117 m!442693))

(assert (=> b!459104 m!442679))

(declare-fun m!442695 () Bool)

(assert (=> b!459104 m!442695))

(declare-fun m!442697 () Bool)

(assert (=> b!459104 m!442697))

(declare-fun m!442699 () Bool)

(assert (=> b!459104 m!442699))

(assert (=> b!459104 m!442679))

(declare-fun m!442701 () Bool)

(assert (=> b!459104 m!442701))

(declare-fun m!442703 () Bool)

(assert (=> b!459104 m!442703))

(declare-fun m!442705 () Bool)

(assert (=> b!459113 m!442705))

(declare-fun m!442707 () Bool)

(assert (=> b!459119 m!442707))

(declare-fun m!442709 () Bool)

(assert (=> b!459119 m!442709))

(declare-fun m!442711 () Bool)

(assert (=> b!459107 m!442711))

(check-sat (not b_next!11011) (not b!459107) tp_is_empty!12349 (not b!459113) (not b!459106) (not mapNonEmpty!20173) (not b!459117) (not b!459111) (not start!41128) b_and!19273 (not b!459105) (not b!459119) (not b!459114) (not b_lambda!9859) (not b!459104) (not b!459118) (not b!459120))
(check-sat b_and!19273 (not b_next!11011))
