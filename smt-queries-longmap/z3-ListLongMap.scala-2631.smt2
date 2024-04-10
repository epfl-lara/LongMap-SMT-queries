; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39606 () Bool)

(assert start!39606)

(declare-fun b_free!9873 () Bool)

(declare-fun b_next!9873 () Bool)

(assert (=> start!39606 (= b_free!9873 (not b_next!9873))))

(declare-fun tp!35147 () Bool)

(declare-fun b_and!17529 () Bool)

(assert (=> start!39606 (= tp!35147 b_and!17529)))

(declare-fun res!248236 () Bool)

(declare-fun e!252116 () Bool)

(assert (=> start!39606 (=> (not res!248236) (not e!252116))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25889 0))(
  ( (array!25890 (arr!12394 (Array (_ BitVec 32) (_ BitVec 64))) (size!12746 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25889)

(assert (=> start!39606 (= res!248236 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12746 _keys!709))))))

(assert (=> start!39606 e!252116))

(declare-fun tp_is_empty!11025 () Bool)

(assert (=> start!39606 tp_is_empty!11025))

(assert (=> start!39606 tp!35147))

(assert (=> start!39606 true))

(declare-datatypes ((V!15805 0))(
  ( (V!15806 (val!5557 Int)) )
))
(declare-datatypes ((ValueCell!5169 0))(
  ( (ValueCellFull!5169 (v!7804 V!15805)) (EmptyCell!5169) )
))
(declare-datatypes ((array!25891 0))(
  ( (array!25892 (arr!12395 (Array (_ BitVec 32) ValueCell!5169)) (size!12747 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25891)

(declare-fun e!252120 () Bool)

(declare-fun array_inv!9032 (array!25891) Bool)

(assert (=> start!39606 (and (array_inv!9032 _values!549) e!252120)))

(declare-fun array_inv!9033 (array!25889) Bool)

(assert (=> start!39606 (array_inv!9033 _keys!709)))

(declare-fun b!424389 () Bool)

(declare-fun e!252118 () Bool)

(assert (=> b!424389 (= e!252118 tp_is_empty!11025)))

(declare-fun b!424390 () Bool)

(declare-fun res!248240 () Bool)

(assert (=> b!424390 (=> (not res!248240) (not e!252116))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424390 (= res!248240 (or (= (select (arr!12394 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12394 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18159 () Bool)

(declare-fun mapRes!18159 () Bool)

(assert (=> mapIsEmpty!18159 mapRes!18159))

(declare-fun mapNonEmpty!18159 () Bool)

(declare-fun tp!35148 () Bool)

(declare-fun e!252119 () Bool)

(assert (=> mapNonEmpty!18159 (= mapRes!18159 (and tp!35148 e!252119))))

(declare-fun mapValue!18159 () ValueCell!5169)

(declare-fun mapKey!18159 () (_ BitVec 32))

(declare-fun mapRest!18159 () (Array (_ BitVec 32) ValueCell!5169))

(assert (=> mapNonEmpty!18159 (= (arr!12395 _values!549) (store mapRest!18159 mapKey!18159 mapValue!18159))))

(declare-fun b!424391 () Bool)

(declare-fun res!248247 () Bool)

(assert (=> b!424391 (=> (not res!248247) (not e!252116))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424391 (= res!248247 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424392 () Bool)

(declare-fun res!248239 () Bool)

(assert (=> b!424392 (=> (not res!248239) (not e!252116))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25889 (_ BitVec 32)) Bool)

(assert (=> b!424392 (= res!248239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424393 () Bool)

(assert (=> b!424393 (= e!252120 (and e!252118 mapRes!18159))))

(declare-fun condMapEmpty!18159 () Bool)

(declare-fun mapDefault!18159 () ValueCell!5169)

(assert (=> b!424393 (= condMapEmpty!18159 (= (arr!12395 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5169)) mapDefault!18159)))))

(declare-fun b!424394 () Bool)

(declare-fun res!248237 () Bool)

(assert (=> b!424394 (=> (not res!248237) (not e!252116))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424394 (= res!248237 (and (= (size!12747 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12746 _keys!709) (size!12747 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424395 () Bool)

(declare-fun res!248244 () Bool)

(assert (=> b!424395 (=> (not res!248244) (not e!252116))))

(assert (=> b!424395 (= res!248244 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12746 _keys!709))))))

(declare-fun b!424396 () Bool)

(declare-fun e!252115 () Bool)

(assert (=> b!424396 (= e!252116 e!252115)))

(declare-fun res!248243 () Bool)

(assert (=> b!424396 (=> (not res!248243) (not e!252115))))

(declare-fun lt!194360 () array!25889)

(assert (=> b!424396 (= res!248243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194360 mask!1025))))

(assert (=> b!424396 (= lt!194360 (array!25890 (store (arr!12394 _keys!709) i!563 k0!794) (size!12746 _keys!709)))))

(declare-fun b!424397 () Bool)

(declare-fun res!248242 () Bool)

(assert (=> b!424397 (=> (not res!248242) (not e!252116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424397 (= res!248242 (validMask!0 mask!1025))))

(declare-fun b!424398 () Bool)

(declare-fun res!248238 () Bool)

(assert (=> b!424398 (=> (not res!248238) (not e!252116))))

(declare-datatypes ((List!7305 0))(
  ( (Nil!7302) (Cons!7301 (h!8157 (_ BitVec 64)) (t!12749 List!7305)) )
))
(declare-fun arrayNoDuplicates!0 (array!25889 (_ BitVec 32) List!7305) Bool)

(assert (=> b!424398 (= res!248238 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7302))))

(declare-fun b!424399 () Bool)

(assert (=> b!424399 (= e!252115 false)))

(declare-fun minValue!515 () V!15805)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7296 0))(
  ( (tuple2!7297 (_1!3659 (_ BitVec 64)) (_2!3659 V!15805)) )
))
(declare-datatypes ((List!7306 0))(
  ( (Nil!7303) (Cons!7302 (h!8158 tuple2!7296) (t!12750 List!7306)) )
))
(declare-datatypes ((ListLongMap!6209 0))(
  ( (ListLongMap!6210 (toList!3120 List!7306)) )
))
(declare-fun lt!194358 () ListLongMap!6209)

(declare-fun zeroValue!515 () V!15805)

(declare-fun v!412 () V!15805)

(declare-fun getCurrentListMapNoExtraKeys!1324 (array!25889 array!25891 (_ BitVec 32) (_ BitVec 32) V!15805 V!15805 (_ BitVec 32) Int) ListLongMap!6209)

(assert (=> b!424399 (= lt!194358 (getCurrentListMapNoExtraKeys!1324 lt!194360 (array!25892 (store (arr!12395 _values!549) i!563 (ValueCellFull!5169 v!412)) (size!12747 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194359 () ListLongMap!6209)

(assert (=> b!424399 (= lt!194359 (getCurrentListMapNoExtraKeys!1324 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!424400 () Bool)

(declare-fun res!248245 () Bool)

(assert (=> b!424400 (=> (not res!248245) (not e!252116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424400 (= res!248245 (validKeyInArray!0 k0!794))))

(declare-fun b!424401 () Bool)

(declare-fun res!248241 () Bool)

(assert (=> b!424401 (=> (not res!248241) (not e!252115))))

(assert (=> b!424401 (= res!248241 (bvsle from!863 i!563))))

(declare-fun b!424402 () Bool)

(declare-fun res!248246 () Bool)

(assert (=> b!424402 (=> (not res!248246) (not e!252115))))

(assert (=> b!424402 (= res!248246 (arrayNoDuplicates!0 lt!194360 #b00000000000000000000000000000000 Nil!7302))))

(declare-fun b!424403 () Bool)

(assert (=> b!424403 (= e!252119 tp_is_empty!11025)))

(assert (= (and start!39606 res!248236) b!424397))

(assert (= (and b!424397 res!248242) b!424394))

(assert (= (and b!424394 res!248237) b!424392))

(assert (= (and b!424392 res!248239) b!424398))

(assert (= (and b!424398 res!248238) b!424395))

(assert (= (and b!424395 res!248244) b!424400))

(assert (= (and b!424400 res!248245) b!424390))

(assert (= (and b!424390 res!248240) b!424391))

(assert (= (and b!424391 res!248247) b!424396))

(assert (= (and b!424396 res!248243) b!424402))

(assert (= (and b!424402 res!248246) b!424401))

(assert (= (and b!424401 res!248241) b!424399))

(assert (= (and b!424393 condMapEmpty!18159) mapIsEmpty!18159))

(assert (= (and b!424393 (not condMapEmpty!18159)) mapNonEmpty!18159))

(get-info :version)

(assert (= (and mapNonEmpty!18159 ((_ is ValueCellFull!5169) mapValue!18159)) b!424403))

(assert (= (and b!424393 ((_ is ValueCellFull!5169) mapDefault!18159)) b!424389))

(assert (= start!39606 b!424393))

(declare-fun m!413553 () Bool)

(assert (=> b!424397 m!413553))

(declare-fun m!413555 () Bool)

(assert (=> b!424399 m!413555))

(declare-fun m!413557 () Bool)

(assert (=> b!424399 m!413557))

(declare-fun m!413559 () Bool)

(assert (=> b!424399 m!413559))

(declare-fun m!413561 () Bool)

(assert (=> b!424396 m!413561))

(declare-fun m!413563 () Bool)

(assert (=> b!424396 m!413563))

(declare-fun m!413565 () Bool)

(assert (=> b!424391 m!413565))

(declare-fun m!413567 () Bool)

(assert (=> b!424400 m!413567))

(declare-fun m!413569 () Bool)

(assert (=> b!424390 m!413569))

(declare-fun m!413571 () Bool)

(assert (=> b!424392 m!413571))

(declare-fun m!413573 () Bool)

(assert (=> mapNonEmpty!18159 m!413573))

(declare-fun m!413575 () Bool)

(assert (=> b!424402 m!413575))

(declare-fun m!413577 () Bool)

(assert (=> b!424398 m!413577))

(declare-fun m!413579 () Bool)

(assert (=> start!39606 m!413579))

(declare-fun m!413581 () Bool)

(assert (=> start!39606 m!413581))

(check-sat (not b!424402) (not b!424391) (not b!424398) (not b!424392) (not b!424396) (not mapNonEmpty!18159) (not b!424397) (not b!424400) (not b!424399) (not b_next!9873) b_and!17529 (not start!39606) tp_is_empty!11025)
(check-sat b_and!17529 (not b_next!9873))
