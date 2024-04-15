; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39884 () Bool)

(assert start!39884)

(declare-fun b_free!10165 () Bool)

(declare-fun b_next!10165 () Bool)

(assert (=> start!39884 (= b_free!10165 (not b_next!10165))))

(declare-fun tp!36023 () Bool)

(declare-fun b_and!17963 () Bool)

(assert (=> start!39884 (= tp!36023 b_and!17963)))

(declare-fun b!432045 () Bool)

(declare-fun e!255561 () Bool)

(declare-fun e!255558 () Bool)

(assert (=> b!432045 (= e!255561 (not e!255558))))

(declare-fun res!254159 () Bool)

(assert (=> b!432045 (=> res!254159 e!255558)))

(declare-datatypes ((array!26461 0))(
  ( (array!26462 (arr!12680 (Array (_ BitVec 32) (_ BitVec 64))) (size!13033 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26461)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432045 (= res!254159 (not (validKeyInArray!0 (select (arr!12680 _keys!709) from!863))))))

(declare-datatypes ((V!16195 0))(
  ( (V!16196 (val!5703 Int)) )
))
(declare-datatypes ((tuple2!7536 0))(
  ( (tuple2!7537 (_1!3779 (_ BitVec 64)) (_2!3779 V!16195)) )
))
(declare-datatypes ((List!7530 0))(
  ( (Nil!7527) (Cons!7526 (h!8382 tuple2!7536) (t!13135 List!7530)) )
))
(declare-datatypes ((ListLongMap!6439 0))(
  ( (ListLongMap!6440 (toList!3235 List!7530)) )
))
(declare-fun lt!197986 () ListLongMap!6439)

(declare-fun lt!197985 () ListLongMap!6439)

(assert (=> b!432045 (= lt!197986 lt!197985)))

(declare-fun lt!197993 () ListLongMap!6439)

(declare-fun lt!197983 () tuple2!7536)

(declare-fun +!1410 (ListLongMap!6439 tuple2!7536) ListLongMap!6439)

(assert (=> b!432045 (= lt!197985 (+!1410 lt!197993 lt!197983))))

(declare-fun minValue!515 () V!16195)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16195)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!197982 () array!26461)

(declare-datatypes ((ValueCell!5315 0))(
  ( (ValueCellFull!5315 (v!7944 V!16195)) (EmptyCell!5315) )
))
(declare-datatypes ((array!26463 0))(
  ( (array!26464 (arr!12681 (Array (_ BitVec 32) ValueCell!5315)) (size!13034 (_ BitVec 32))) )
))
(declare-fun lt!197990 () array!26463)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1440 (array!26461 array!26463 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) Int) ListLongMap!6439)

(assert (=> b!432045 (= lt!197986 (getCurrentListMapNoExtraKeys!1440 lt!197982 lt!197990 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16195)

(assert (=> b!432045 (= lt!197983 (tuple2!7537 k0!794 v!412))))

(declare-fun _values!549 () array!26463)

(assert (=> b!432045 (= lt!197993 (getCurrentListMapNoExtraKeys!1440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12744 0))(
  ( (Unit!12745) )
))
(declare-fun lt!197996 () Unit!12744)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!566 (array!26461 array!26463 (_ BitVec 32) (_ BitVec 32) V!16195 V!16195 (_ BitVec 32) (_ BitVec 64) V!16195 (_ BitVec 32) Int) Unit!12744)

(assert (=> b!432045 (= lt!197996 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!566 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432046 () Bool)

(declare-fun e!255560 () Unit!12744)

(declare-fun Unit!12746 () Unit!12744)

(assert (=> b!432046 (= e!255560 Unit!12746)))

(declare-fun lt!197995 () Unit!12744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12744)

(assert (=> b!432046 (= lt!197995 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432046 false))

(declare-fun b!432047 () Bool)

(declare-fun res!254158 () Bool)

(declare-fun e!255567 () Bool)

(assert (=> b!432047 (=> (not res!254158) (not e!255567))))

(declare-datatypes ((List!7531 0))(
  ( (Nil!7528) (Cons!7527 (h!8383 (_ BitVec 64)) (t!13136 List!7531)) )
))
(declare-fun arrayNoDuplicates!0 (array!26461 (_ BitVec 32) List!7531) Bool)

(assert (=> b!432047 (= res!254158 (arrayNoDuplicates!0 lt!197982 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun b!432048 () Bool)

(declare-fun res!254162 () Bool)

(declare-fun e!255562 () Bool)

(assert (=> b!432048 (=> (not res!254162) (not e!255562))))

(assert (=> b!432048 (= res!254162 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13033 _keys!709))))))

(declare-fun b!432049 () Bool)

(declare-fun res!254161 () Bool)

(assert (=> b!432049 (=> (not res!254161) (not e!255562))))

(assert (=> b!432049 (= res!254161 (or (= (select (arr!12680 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12680 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432050 () Bool)

(declare-fun res!254154 () Bool)

(assert (=> b!432050 (=> (not res!254154) (not e!255562))))

(declare-fun arrayContainsKey!0 (array!26461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432050 (= res!254154 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432051 () Bool)

(assert (=> b!432051 (= e!255567 e!255561)))

(declare-fun res!254153 () Bool)

(assert (=> b!432051 (=> (not res!254153) (not e!255561))))

(assert (=> b!432051 (= res!254153 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197992 () ListLongMap!6439)

(assert (=> b!432051 (= lt!197992 (getCurrentListMapNoExtraKeys!1440 lt!197982 lt!197990 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432051 (= lt!197990 (array!26464 (store (arr!12681 _values!549) i!563 (ValueCellFull!5315 v!412)) (size!13034 _values!549)))))

(declare-fun lt!197984 () ListLongMap!6439)

(assert (=> b!432051 (= lt!197984 (getCurrentListMapNoExtraKeys!1440 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432052 () Bool)

(declare-fun res!254165 () Bool)

(assert (=> b!432052 (=> (not res!254165) (not e!255567))))

(assert (=> b!432052 (= res!254165 (bvsle from!863 i!563))))

(declare-fun b!432053 () Bool)

(declare-fun e!255564 () Bool)

(declare-fun tp_is_empty!11317 () Bool)

(assert (=> b!432053 (= e!255564 tp_is_empty!11317)))

(declare-fun b!432054 () Bool)

(declare-fun e!255563 () Bool)

(assert (=> b!432054 (= e!255558 e!255563)))

(declare-fun res!254164 () Bool)

(assert (=> b!432054 (=> res!254164 e!255563)))

(assert (=> b!432054 (= res!254164 (= k0!794 (select (arr!12680 _keys!709) from!863)))))

(assert (=> b!432054 (not (= (select (arr!12680 _keys!709) from!863) k0!794))))

(declare-fun lt!197991 () Unit!12744)

(assert (=> b!432054 (= lt!197991 e!255560)))

(declare-fun c!55512 () Bool)

(assert (=> b!432054 (= c!55512 (= (select (arr!12680 _keys!709) from!863) k0!794))))

(declare-fun lt!197988 () ListLongMap!6439)

(assert (=> b!432054 (= lt!197992 lt!197988)))

(declare-fun lt!197994 () tuple2!7536)

(assert (=> b!432054 (= lt!197988 (+!1410 lt!197985 lt!197994))))

(declare-fun lt!197987 () V!16195)

(assert (=> b!432054 (= lt!197994 (tuple2!7537 (select (arr!12680 _keys!709) from!863) lt!197987))))

(declare-fun get!6303 (ValueCell!5315 V!16195) V!16195)

(declare-fun dynLambda!797 (Int (_ BitVec 64)) V!16195)

(assert (=> b!432054 (= lt!197987 (get!6303 (select (arr!12681 _values!549) from!863) (dynLambda!797 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432055 () Bool)

(declare-fun res!254157 () Bool)

(assert (=> b!432055 (=> (not res!254157) (not e!255562))))

(assert (=> b!432055 (= res!254157 (and (= (size!13034 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13033 _keys!709) (size!13034 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432056 () Bool)

(assert (=> b!432056 (= e!255563 true)))

(assert (=> b!432056 (= lt!197988 (+!1410 (+!1410 lt!197993 lt!197994) lt!197983))))

(declare-fun lt!197989 () Unit!12744)

(declare-fun addCommutativeForDiffKeys!370 (ListLongMap!6439 (_ BitVec 64) V!16195 (_ BitVec 64) V!16195) Unit!12744)

(assert (=> b!432056 (= lt!197989 (addCommutativeForDiffKeys!370 lt!197993 k0!794 v!412 (select (arr!12680 _keys!709) from!863) lt!197987))))

(declare-fun b!432057 () Bool)

(declare-fun Unit!12747 () Unit!12744)

(assert (=> b!432057 (= e!255560 Unit!12747)))

(declare-fun res!254156 () Bool)

(assert (=> start!39884 (=> (not res!254156) (not e!255562))))

(assert (=> start!39884 (= res!254156 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13033 _keys!709))))))

(assert (=> start!39884 e!255562))

(assert (=> start!39884 tp_is_empty!11317))

(assert (=> start!39884 tp!36023))

(assert (=> start!39884 true))

(declare-fun e!255565 () Bool)

(declare-fun array_inv!9260 (array!26463) Bool)

(assert (=> start!39884 (and (array_inv!9260 _values!549) e!255565)))

(declare-fun array_inv!9261 (array!26461) Bool)

(assert (=> start!39884 (array_inv!9261 _keys!709)))

(declare-fun b!432058 () Bool)

(declare-fun res!254163 () Bool)

(assert (=> b!432058 (=> (not res!254163) (not e!255562))))

(assert (=> b!432058 (= res!254163 (validKeyInArray!0 k0!794))))

(declare-fun b!432059 () Bool)

(assert (=> b!432059 (= e!255562 e!255567)))

(declare-fun res!254160 () Bool)

(assert (=> b!432059 (=> (not res!254160) (not e!255567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26461 (_ BitVec 32)) Bool)

(assert (=> b!432059 (= res!254160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197982 mask!1025))))

(assert (=> b!432059 (= lt!197982 (array!26462 (store (arr!12680 _keys!709) i!563 k0!794) (size!13033 _keys!709)))))

(declare-fun b!432060 () Bool)

(declare-fun res!254166 () Bool)

(assert (=> b!432060 (=> (not res!254166) (not e!255562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432060 (= res!254166 (validMask!0 mask!1025))))

(declare-fun b!432061 () Bool)

(declare-fun e!255559 () Bool)

(assert (=> b!432061 (= e!255559 tp_is_empty!11317)))

(declare-fun b!432062 () Bool)

(declare-fun res!254152 () Bool)

(assert (=> b!432062 (=> (not res!254152) (not e!255562))))

(assert (=> b!432062 (= res!254152 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7528))))

(declare-fun b!432063 () Bool)

(declare-fun res!254155 () Bool)

(assert (=> b!432063 (=> (not res!254155) (not e!255562))))

(assert (=> b!432063 (= res!254155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432064 () Bool)

(declare-fun mapRes!18597 () Bool)

(assert (=> b!432064 (= e!255565 (and e!255564 mapRes!18597))))

(declare-fun condMapEmpty!18597 () Bool)

(declare-fun mapDefault!18597 () ValueCell!5315)

(assert (=> b!432064 (= condMapEmpty!18597 (= (arr!12681 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5315)) mapDefault!18597)))))

(declare-fun mapIsEmpty!18597 () Bool)

(assert (=> mapIsEmpty!18597 mapRes!18597))

(declare-fun mapNonEmpty!18597 () Bool)

(declare-fun tp!36024 () Bool)

(assert (=> mapNonEmpty!18597 (= mapRes!18597 (and tp!36024 e!255559))))

(declare-fun mapValue!18597 () ValueCell!5315)

(declare-fun mapRest!18597 () (Array (_ BitVec 32) ValueCell!5315))

(declare-fun mapKey!18597 () (_ BitVec 32))

(assert (=> mapNonEmpty!18597 (= (arr!12681 _values!549) (store mapRest!18597 mapKey!18597 mapValue!18597))))

(assert (= (and start!39884 res!254156) b!432060))

(assert (= (and b!432060 res!254166) b!432055))

(assert (= (and b!432055 res!254157) b!432063))

(assert (= (and b!432063 res!254155) b!432062))

(assert (= (and b!432062 res!254152) b!432048))

(assert (= (and b!432048 res!254162) b!432058))

(assert (= (and b!432058 res!254163) b!432049))

(assert (= (and b!432049 res!254161) b!432050))

(assert (= (and b!432050 res!254154) b!432059))

(assert (= (and b!432059 res!254160) b!432047))

(assert (= (and b!432047 res!254158) b!432052))

(assert (= (and b!432052 res!254165) b!432051))

(assert (= (and b!432051 res!254153) b!432045))

(assert (= (and b!432045 (not res!254159)) b!432054))

(assert (= (and b!432054 c!55512) b!432046))

(assert (= (and b!432054 (not c!55512)) b!432057))

(assert (= (and b!432054 (not res!254164)) b!432056))

(assert (= (and b!432064 condMapEmpty!18597) mapIsEmpty!18597))

(assert (= (and b!432064 (not condMapEmpty!18597)) mapNonEmpty!18597))

(get-info :version)

(assert (= (and mapNonEmpty!18597 ((_ is ValueCellFull!5315) mapValue!18597)) b!432061))

(assert (= (and b!432064 ((_ is ValueCellFull!5315) mapDefault!18597)) b!432053))

(assert (= start!39884 b!432064))

(declare-fun b_lambda!9235 () Bool)

(assert (=> (not b_lambda!9235) (not b!432054)))

(declare-fun t!13134 () Bool)

(declare-fun tb!3563 () Bool)

(assert (=> (and start!39884 (= defaultEntry!557 defaultEntry!557) t!13134) tb!3563))

(declare-fun result!6661 () Bool)

(assert (=> tb!3563 (= result!6661 tp_is_empty!11317)))

(assert (=> b!432054 t!13134))

(declare-fun b_and!17965 () Bool)

(assert (= b_and!17963 (and (=> t!13134 result!6661) b_and!17965)))

(declare-fun m!419673 () Bool)

(assert (=> b!432063 m!419673))

(declare-fun m!419675 () Bool)

(assert (=> b!432051 m!419675))

(declare-fun m!419677 () Bool)

(assert (=> b!432051 m!419677))

(declare-fun m!419679 () Bool)

(assert (=> b!432051 m!419679))

(declare-fun m!419681 () Bool)

(assert (=> b!432058 m!419681))

(declare-fun m!419683 () Bool)

(assert (=> b!432049 m!419683))

(declare-fun m!419685 () Bool)

(assert (=> b!432062 m!419685))

(declare-fun m!419687 () Bool)

(assert (=> b!432060 m!419687))

(declare-fun m!419689 () Bool)

(assert (=> b!432050 m!419689))

(declare-fun m!419691 () Bool)

(assert (=> b!432054 m!419691))

(declare-fun m!419693 () Bool)

(assert (=> b!432054 m!419693))

(declare-fun m!419695 () Bool)

(assert (=> b!432054 m!419695))

(assert (=> b!432054 m!419695))

(assert (=> b!432054 m!419693))

(declare-fun m!419697 () Bool)

(assert (=> b!432054 m!419697))

(declare-fun m!419699 () Bool)

(assert (=> b!432054 m!419699))

(declare-fun m!419701 () Bool)

(assert (=> b!432046 m!419701))

(declare-fun m!419703 () Bool)

(assert (=> b!432047 m!419703))

(declare-fun m!419705 () Bool)

(assert (=> start!39884 m!419705))

(declare-fun m!419707 () Bool)

(assert (=> start!39884 m!419707))

(declare-fun m!419709 () Bool)

(assert (=> mapNonEmpty!18597 m!419709))

(declare-fun m!419711 () Bool)

(assert (=> b!432045 m!419711))

(assert (=> b!432045 m!419691))

(declare-fun m!419713 () Bool)

(assert (=> b!432045 m!419713))

(declare-fun m!419715 () Bool)

(assert (=> b!432045 m!419715))

(declare-fun m!419717 () Bool)

(assert (=> b!432045 m!419717))

(declare-fun m!419719 () Bool)

(assert (=> b!432045 m!419719))

(assert (=> b!432045 m!419691))

(declare-fun m!419721 () Bool)

(assert (=> b!432056 m!419721))

(assert (=> b!432056 m!419721))

(declare-fun m!419723 () Bool)

(assert (=> b!432056 m!419723))

(assert (=> b!432056 m!419691))

(assert (=> b!432056 m!419691))

(declare-fun m!419725 () Bool)

(assert (=> b!432056 m!419725))

(declare-fun m!419727 () Bool)

(assert (=> b!432059 m!419727))

(declare-fun m!419729 () Bool)

(assert (=> b!432059 m!419729))

(check-sat (not b!432060) (not b!432045) (not b!432063) (not b!432062) (not b!432056) (not start!39884) b_and!17965 tp_is_empty!11317 (not b!432054) (not b!432046) (not b_next!10165) (not b!432051) (not b_lambda!9235) (not mapNonEmpty!18597) (not b!432047) (not b!432058) (not b!432050) (not b!432059))
(check-sat b_and!17965 (not b_next!10165))
