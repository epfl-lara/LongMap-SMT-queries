; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39920 () Bool)

(assert start!39920)

(declare-fun b_free!10201 () Bool)

(declare-fun b_next!10201 () Bool)

(assert (=> start!39920 (= b_free!10201 (not b_next!10201))))

(declare-fun tp!36132 () Bool)

(declare-fun b_and!18075 () Bool)

(assert (=> start!39920 (= tp!36132 b_and!18075)))

(declare-fun b!433383 () Bool)

(declare-fun e!256241 () Bool)

(declare-fun e!256249 () Bool)

(assert (=> b!433383 (= e!256241 e!256249)))

(declare-fun res!255098 () Bool)

(assert (=> b!433383 (=> res!255098 e!256249)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26542 0))(
  ( (array!26543 (arr!12720 (Array (_ BitVec 32) (_ BitVec 64))) (size!13072 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26542)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!433383 (= res!255098 (= k0!794 (select (arr!12720 _keys!709) from!863)))))

(assert (=> b!433383 (not (= (select (arr!12720 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12829 0))(
  ( (Unit!12830) )
))
(declare-fun lt!199052 () Unit!12829)

(declare-fun e!256243 () Unit!12829)

(assert (=> b!433383 (= lt!199052 e!256243)))

(declare-fun c!55614 () Bool)

(assert (=> b!433383 (= c!55614 (= (select (arr!12720 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16243 0))(
  ( (V!16244 (val!5721 Int)) )
))
(declare-datatypes ((tuple2!7468 0))(
  ( (tuple2!7469 (_1!3745 (_ BitVec 64)) (_2!3745 V!16243)) )
))
(declare-datatypes ((List!7458 0))(
  ( (Nil!7455) (Cons!7454 (h!8310 tuple2!7468) (t!13100 List!7458)) )
))
(declare-datatypes ((ListLongMap!6383 0))(
  ( (ListLongMap!6384 (toList!3207 List!7458)) )
))
(declare-fun lt!199055 () ListLongMap!6383)

(declare-fun lt!199053 () ListLongMap!6383)

(assert (=> b!433383 (= lt!199055 lt!199053)))

(declare-fun lt!199046 () ListLongMap!6383)

(declare-fun lt!199057 () tuple2!7468)

(declare-fun +!1414 (ListLongMap!6383 tuple2!7468) ListLongMap!6383)

(assert (=> b!433383 (= lt!199053 (+!1414 lt!199046 lt!199057))))

(declare-fun lt!199051 () V!16243)

(assert (=> b!433383 (= lt!199057 (tuple2!7469 (select (arr!12720 _keys!709) from!863) lt!199051))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5333 0))(
  ( (ValueCellFull!5333 (v!7969 V!16243)) (EmptyCell!5333) )
))
(declare-datatypes ((array!26544 0))(
  ( (array!26545 (arr!12721 (Array (_ BitVec 32) ValueCell!5333)) (size!13073 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26544)

(declare-fun get!6339 (ValueCell!5333 V!16243) V!16243)

(declare-fun dynLambda!818 (Int (_ BitVec 64)) V!16243)

(assert (=> b!433383 (= lt!199051 (get!6339 (select (arr!12721 _values!549) from!863) (dynLambda!818 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433384 () Bool)

(declare-fun res!255089 () Bool)

(declare-fun e!256245 () Bool)

(assert (=> b!433384 (=> (not res!255089) (not e!256245))))

(declare-datatypes ((List!7459 0))(
  ( (Nil!7456) (Cons!7455 (h!8311 (_ BitVec 64)) (t!13101 List!7459)) )
))
(declare-fun arrayNoDuplicates!0 (array!26542 (_ BitVec 32) List!7459) Bool)

(assert (=> b!433384 (= res!255089 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7456))))

(declare-fun mapIsEmpty!18651 () Bool)

(declare-fun mapRes!18651 () Bool)

(assert (=> mapIsEmpty!18651 mapRes!18651))

(declare-fun b!433385 () Bool)

(declare-fun res!255102 () Bool)

(assert (=> b!433385 (=> (not res!255102) (not e!256245))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433385 (= res!255102 (and (= (size!13073 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13072 _keys!709) (size!13073 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433386 () Bool)

(assert (=> b!433386 (= e!256249 true)))

(declare-fun lt!199048 () ListLongMap!6383)

(declare-fun lt!199054 () tuple2!7468)

(assert (=> b!433386 (= lt!199053 (+!1414 (+!1414 lt!199048 lt!199057) lt!199054))))

(declare-fun lt!199047 () Unit!12829)

(declare-fun v!412 () V!16243)

(declare-fun addCommutativeForDiffKeys!387 (ListLongMap!6383 (_ BitVec 64) V!16243 (_ BitVec 64) V!16243) Unit!12829)

(assert (=> b!433386 (= lt!199047 (addCommutativeForDiffKeys!387 lt!199048 k0!794 v!412 (select (arr!12720 _keys!709) from!863) lt!199051))))

(declare-fun b!433387 () Bool)

(declare-fun e!256246 () Bool)

(declare-fun tp_is_empty!11353 () Bool)

(assert (=> b!433387 (= e!256246 tp_is_empty!11353)))

(declare-fun b!433388 () Bool)

(declare-fun res!255090 () Bool)

(assert (=> b!433388 (=> (not res!255090) (not e!256245))))

(declare-fun arrayContainsKey!0 (array!26542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433388 (= res!255090 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18651 () Bool)

(declare-fun tp!36131 () Bool)

(assert (=> mapNonEmpty!18651 (= mapRes!18651 (and tp!36131 e!256246))))

(declare-fun mapKey!18651 () (_ BitVec 32))

(declare-fun mapValue!18651 () ValueCell!5333)

(declare-fun mapRest!18651 () (Array (_ BitVec 32) ValueCell!5333))

(assert (=> mapNonEmpty!18651 (= (arr!12721 _values!549) (store mapRest!18651 mapKey!18651 mapValue!18651))))

(declare-fun b!433389 () Bool)

(declare-fun res!255100 () Bool)

(assert (=> b!433389 (=> (not res!255100) (not e!256245))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433389 (= res!255100 (or (= (select (arr!12720 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12720 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433390 () Bool)

(declare-fun res!255101 () Bool)

(declare-fun e!256240 () Bool)

(assert (=> b!433390 (=> (not res!255101) (not e!256240))))

(assert (=> b!433390 (= res!255101 (bvsle from!863 i!563))))

(declare-fun res!255094 () Bool)

(assert (=> start!39920 (=> (not res!255094) (not e!256245))))

(assert (=> start!39920 (= res!255094 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13072 _keys!709))))))

(assert (=> start!39920 e!256245))

(assert (=> start!39920 tp_is_empty!11353))

(assert (=> start!39920 tp!36132))

(assert (=> start!39920 true))

(declare-fun e!256242 () Bool)

(declare-fun array_inv!9306 (array!26544) Bool)

(assert (=> start!39920 (and (array_inv!9306 _values!549) e!256242)))

(declare-fun array_inv!9307 (array!26542) Bool)

(assert (=> start!39920 (array_inv!9307 _keys!709)))

(declare-fun b!433391 () Bool)

(assert (=> b!433391 (= e!256245 e!256240)))

(declare-fun res!255099 () Bool)

(assert (=> b!433391 (=> (not res!255099) (not e!256240))))

(declare-fun lt!199059 () array!26542)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26542 (_ BitVec 32)) Bool)

(assert (=> b!433391 (= res!255099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199059 mask!1025))))

(assert (=> b!433391 (= lt!199059 (array!26543 (store (arr!12720 _keys!709) i!563 k0!794) (size!13072 _keys!709)))))

(declare-fun b!433392 () Bool)

(declare-fun res!255097 () Bool)

(assert (=> b!433392 (=> (not res!255097) (not e!256245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433392 (= res!255097 (validMask!0 mask!1025))))

(declare-fun b!433393 () Bool)

(declare-fun Unit!12831 () Unit!12829)

(assert (=> b!433393 (= e!256243 Unit!12831)))

(declare-fun b!433394 () Bool)

(declare-fun res!255092 () Bool)

(assert (=> b!433394 (=> (not res!255092) (not e!256245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433394 (= res!255092 (validKeyInArray!0 k0!794))))

(declare-fun b!433395 () Bool)

(declare-fun e!256244 () Bool)

(assert (=> b!433395 (= e!256244 (not e!256241))))

(declare-fun res!255096 () Bool)

(assert (=> b!433395 (=> res!255096 e!256241)))

(assert (=> b!433395 (= res!255096 (not (validKeyInArray!0 (select (arr!12720 _keys!709) from!863))))))

(declare-fun lt!199058 () ListLongMap!6383)

(assert (=> b!433395 (= lt!199058 lt!199046)))

(assert (=> b!433395 (= lt!199046 (+!1414 lt!199048 lt!199054))))

(declare-fun minValue!515 () V!16243)

(declare-fun zeroValue!515 () V!16243)

(declare-fun lt!199056 () array!26544)

(declare-fun getCurrentListMapNoExtraKeys!1443 (array!26542 array!26544 (_ BitVec 32) (_ BitVec 32) V!16243 V!16243 (_ BitVec 32) Int) ListLongMap!6383)

(assert (=> b!433395 (= lt!199058 (getCurrentListMapNoExtraKeys!1443 lt!199059 lt!199056 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!433395 (= lt!199054 (tuple2!7469 k0!794 v!412))))

(assert (=> b!433395 (= lt!199048 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199049 () Unit!12829)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 (array!26542 array!26544 (_ BitVec 32) (_ BitVec 32) V!16243 V!16243 (_ BitVec 32) (_ BitVec 64) V!16243 (_ BitVec 32) Int) Unit!12829)

(assert (=> b!433395 (= lt!199049 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!582 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433396 () Bool)

(declare-fun res!255093 () Bool)

(assert (=> b!433396 (=> (not res!255093) (not e!256245))))

(assert (=> b!433396 (= res!255093 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13072 _keys!709))))))

(declare-fun b!433397 () Bool)

(declare-fun res!255088 () Bool)

(assert (=> b!433397 (=> (not res!255088) (not e!256245))))

(assert (=> b!433397 (= res!255088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433398 () Bool)

(declare-fun Unit!12832 () Unit!12829)

(assert (=> b!433398 (= e!256243 Unit!12832)))

(declare-fun lt!199045 () Unit!12829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12829)

(assert (=> b!433398 (= lt!199045 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433398 false))

(declare-fun b!433399 () Bool)

(declare-fun e!256248 () Bool)

(assert (=> b!433399 (= e!256248 tp_is_empty!11353)))

(declare-fun b!433400 () Bool)

(assert (=> b!433400 (= e!256240 e!256244)))

(declare-fun res!255091 () Bool)

(assert (=> b!433400 (=> (not res!255091) (not e!256244))))

(assert (=> b!433400 (= res!255091 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433400 (= lt!199055 (getCurrentListMapNoExtraKeys!1443 lt!199059 lt!199056 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433400 (= lt!199056 (array!26545 (store (arr!12721 _values!549) i!563 (ValueCellFull!5333 v!412)) (size!13073 _values!549)))))

(declare-fun lt!199050 () ListLongMap!6383)

(assert (=> b!433400 (= lt!199050 (getCurrentListMapNoExtraKeys!1443 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433401 () Bool)

(assert (=> b!433401 (= e!256242 (and e!256248 mapRes!18651))))

(declare-fun condMapEmpty!18651 () Bool)

(declare-fun mapDefault!18651 () ValueCell!5333)

(assert (=> b!433401 (= condMapEmpty!18651 (= (arr!12721 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5333)) mapDefault!18651)))))

(declare-fun b!433402 () Bool)

(declare-fun res!255095 () Bool)

(assert (=> b!433402 (=> (not res!255095) (not e!256240))))

(assert (=> b!433402 (= res!255095 (arrayNoDuplicates!0 lt!199059 #b00000000000000000000000000000000 Nil!7456))))

(assert (= (and start!39920 res!255094) b!433392))

(assert (= (and b!433392 res!255097) b!433385))

(assert (= (and b!433385 res!255102) b!433397))

(assert (= (and b!433397 res!255088) b!433384))

(assert (= (and b!433384 res!255089) b!433396))

(assert (= (and b!433396 res!255093) b!433394))

(assert (= (and b!433394 res!255092) b!433389))

(assert (= (and b!433389 res!255100) b!433388))

(assert (= (and b!433388 res!255090) b!433391))

(assert (= (and b!433391 res!255099) b!433402))

(assert (= (and b!433402 res!255095) b!433390))

(assert (= (and b!433390 res!255101) b!433400))

(assert (= (and b!433400 res!255091) b!433395))

(assert (= (and b!433395 (not res!255096)) b!433383))

(assert (= (and b!433383 c!55614) b!433398))

(assert (= (and b!433383 (not c!55614)) b!433393))

(assert (= (and b!433383 (not res!255098)) b!433386))

(assert (= (and b!433401 condMapEmpty!18651) mapIsEmpty!18651))

(assert (= (and b!433401 (not condMapEmpty!18651)) mapNonEmpty!18651))

(get-info :version)

(assert (= (and mapNonEmpty!18651 ((_ is ValueCellFull!5333) mapValue!18651)) b!433387))

(assert (= (and b!433401 ((_ is ValueCellFull!5333) mapDefault!18651)) b!433399))

(assert (= start!39920 b!433401))

(declare-fun b_lambda!9311 () Bool)

(assert (=> (not b_lambda!9311) (not b!433383)))

(declare-fun t!13099 () Bool)

(declare-fun tb!3599 () Bool)

(assert (=> (and start!39920 (= defaultEntry!557 defaultEntry!557) t!13099) tb!3599))

(declare-fun result!6733 () Bool)

(assert (=> tb!3599 (= result!6733 tp_is_empty!11353)))

(assert (=> b!433383 t!13099))

(declare-fun b_and!18077 () Bool)

(assert (= b_and!18075 (and (=> t!13099 result!6733) b_and!18077)))

(declare-fun m!421667 () Bool)

(assert (=> b!433384 m!421667))

(declare-fun m!421669 () Bool)

(assert (=> start!39920 m!421669))

(declare-fun m!421671 () Bool)

(assert (=> start!39920 m!421671))

(declare-fun m!421673 () Bool)

(assert (=> b!433389 m!421673))

(declare-fun m!421675 () Bool)

(assert (=> b!433394 m!421675))

(declare-fun m!421677 () Bool)

(assert (=> b!433395 m!421677))

(declare-fun m!421679 () Bool)

(assert (=> b!433395 m!421679))

(declare-fun m!421681 () Bool)

(assert (=> b!433395 m!421681))

(declare-fun m!421683 () Bool)

(assert (=> b!433395 m!421683))

(assert (=> b!433395 m!421677))

(declare-fun m!421685 () Bool)

(assert (=> b!433395 m!421685))

(declare-fun m!421687 () Bool)

(assert (=> b!433395 m!421687))

(declare-fun m!421689 () Bool)

(assert (=> b!433398 m!421689))

(assert (=> b!433383 m!421677))

(declare-fun m!421691 () Bool)

(assert (=> b!433383 m!421691))

(declare-fun m!421693 () Bool)

(assert (=> b!433383 m!421693))

(declare-fun m!421695 () Bool)

(assert (=> b!433383 m!421695))

(assert (=> b!433383 m!421695))

(assert (=> b!433383 m!421693))

(declare-fun m!421697 () Bool)

(assert (=> b!433383 m!421697))

(declare-fun m!421699 () Bool)

(assert (=> b!433392 m!421699))

(declare-fun m!421701 () Bool)

(assert (=> b!433388 m!421701))

(declare-fun m!421703 () Bool)

(assert (=> b!433397 m!421703))

(declare-fun m!421705 () Bool)

(assert (=> b!433400 m!421705))

(declare-fun m!421707 () Bool)

(assert (=> b!433400 m!421707))

(declare-fun m!421709 () Bool)

(assert (=> b!433400 m!421709))

(declare-fun m!421711 () Bool)

(assert (=> b!433402 m!421711))

(declare-fun m!421713 () Bool)

(assert (=> b!433391 m!421713))

(declare-fun m!421715 () Bool)

(assert (=> b!433391 m!421715))

(declare-fun m!421717 () Bool)

(assert (=> b!433386 m!421717))

(assert (=> b!433386 m!421717))

(declare-fun m!421719 () Bool)

(assert (=> b!433386 m!421719))

(assert (=> b!433386 m!421677))

(assert (=> b!433386 m!421677))

(declare-fun m!421721 () Bool)

(assert (=> b!433386 m!421721))

(declare-fun m!421723 () Bool)

(assert (=> mapNonEmpty!18651 m!421723))

(check-sat (not b!433400) (not b!433398) (not b!433383) (not start!39920) (not mapNonEmpty!18651) (not b!433394) (not b_next!10201) (not b_lambda!9311) (not b!433388) (not b!433397) (not b!433391) (not b!433395) tp_is_empty!11353 (not b!433392) b_and!18077 (not b!433402) (not b!433384) (not b!433386))
(check-sat b_and!18077 (not b_next!10201))
