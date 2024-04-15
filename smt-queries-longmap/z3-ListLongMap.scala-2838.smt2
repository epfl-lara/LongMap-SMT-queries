; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40978 () Bool)

(assert start!40978)

(declare-fun b_free!10927 () Bool)

(declare-fun b_next!10927 () Bool)

(assert (=> start!40978 (= b_free!10927 (not b_next!10927))))

(declare-fun tp!38607 () Bool)

(declare-fun b_and!19043 () Bool)

(assert (=> start!40978 (= tp!38607 b_and!19043)))

(declare-fun b!456222 () Bool)

(declare-fun res!272290 () Bool)

(declare-fun e!266533 () Bool)

(assert (=> b!456222 (=> (not res!272290) (not e!266533))))

(declare-datatypes ((array!28321 0))(
  ( (array!28322 (arr!13604 (Array (_ BitVec 32) (_ BitVec 64))) (size!13957 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28321)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28321 (_ BitVec 32)) Bool)

(assert (=> b!456222 (= res!272290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456223 () Bool)

(declare-fun res!272282 () Bool)

(assert (=> b!456223 (=> (not res!272282) (not e!266533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456223 (= res!272282 (validMask!0 mask!1025))))

(declare-fun b!456224 () Bool)

(declare-fun e!266535 () Bool)

(declare-fun e!266538 () Bool)

(declare-fun mapRes!20038 () Bool)

(assert (=> b!456224 (= e!266535 (and e!266538 mapRes!20038))))

(declare-fun condMapEmpty!20038 () Bool)

(declare-datatypes ((V!17459 0))(
  ( (V!17460 (val!6177 Int)) )
))
(declare-datatypes ((ValueCell!5789 0))(
  ( (ValueCellFull!5789 (v!8437 V!17459)) (EmptyCell!5789) )
))
(declare-datatypes ((array!28323 0))(
  ( (array!28324 (arr!13605 (Array (_ BitVec 32) ValueCell!5789)) (size!13958 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28323)

(declare-fun mapDefault!20038 () ValueCell!5789)

(assert (=> b!456224 (= condMapEmpty!20038 (= (arr!13605 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5789)) mapDefault!20038)))))

(declare-fun b!456225 () Bool)

(declare-fun res!272283 () Bool)

(declare-fun e!266539 () Bool)

(assert (=> b!456225 (=> (not res!272283) (not e!266539))))

(declare-fun lt!206335 () array!28321)

(declare-datatypes ((List!8218 0))(
  ( (Nil!8215) (Cons!8214 (h!9070 (_ BitVec 64)) (t!14037 List!8218)) )
))
(declare-fun arrayNoDuplicates!0 (array!28321 (_ BitVec 32) List!8218) Bool)

(assert (=> b!456225 (= res!272283 (arrayNoDuplicates!0 lt!206335 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun b!456226 () Bool)

(assert (=> b!456226 (= e!266533 e!266539)))

(declare-fun res!272285 () Bool)

(assert (=> b!456226 (=> (not res!272285) (not e!266539))))

(assert (=> b!456226 (= res!272285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206335 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456226 (= lt!206335 (array!28322 (store (arr!13604 _keys!709) i!563 k0!794) (size!13957 _keys!709)))))

(declare-fun b!456227 () Bool)

(declare-fun res!272287 () Bool)

(assert (=> b!456227 (=> (not res!272287) (not e!266533))))

(assert (=> b!456227 (= res!272287 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13957 _keys!709))))))

(declare-fun res!272284 () Bool)

(assert (=> start!40978 (=> (not res!272284) (not e!266533))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40978 (= res!272284 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13957 _keys!709))))))

(assert (=> start!40978 e!266533))

(declare-fun tp_is_empty!12265 () Bool)

(assert (=> start!40978 tp_is_empty!12265))

(assert (=> start!40978 tp!38607))

(assert (=> start!40978 true))

(declare-fun array_inv!9914 (array!28323) Bool)

(assert (=> start!40978 (and (array_inv!9914 _values!549) e!266535)))

(declare-fun array_inv!9915 (array!28321) Bool)

(assert (=> start!40978 (array_inv!9915 _keys!709)))

(declare-fun mapIsEmpty!20038 () Bool)

(assert (=> mapIsEmpty!20038 mapRes!20038))

(declare-fun b!456228 () Bool)

(declare-fun res!272292 () Bool)

(assert (=> b!456228 (=> (not res!272292) (not e!266539))))

(assert (=> b!456228 (= res!272292 (bvsle from!863 i!563))))

(declare-fun b!456229 () Bool)

(declare-fun res!272286 () Bool)

(assert (=> b!456229 (=> (not res!272286) (not e!266533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456229 (= res!272286 (validKeyInArray!0 k0!794))))

(declare-fun b!456230 () Bool)

(declare-fun res!272289 () Bool)

(assert (=> b!456230 (=> (not res!272289) (not e!266533))))

(assert (=> b!456230 (= res!272289 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8215))))

(declare-fun mapNonEmpty!20038 () Bool)

(declare-fun tp!38608 () Bool)

(declare-fun e!266536 () Bool)

(assert (=> mapNonEmpty!20038 (= mapRes!20038 (and tp!38608 e!266536))))

(declare-fun mapKey!20038 () (_ BitVec 32))

(declare-fun mapValue!20038 () ValueCell!5789)

(declare-fun mapRest!20038 () (Array (_ BitVec 32) ValueCell!5789))

(assert (=> mapNonEmpty!20038 (= (arr!13605 _values!549) (store mapRest!20038 mapKey!20038 mapValue!20038))))

(declare-fun b!456231 () Bool)

(declare-fun res!272293 () Bool)

(assert (=> b!456231 (=> (not res!272293) (not e!266533))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!456231 (= res!272293 (and (= (size!13958 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13957 _keys!709) (size!13958 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456232 () Bool)

(assert (=> b!456232 (= e!266536 tp_is_empty!12265)))

(declare-fun b!456233 () Bool)

(assert (=> b!456233 (= e!266538 tp_is_empty!12265)))

(declare-fun b!456234 () Bool)

(declare-fun e!266537 () Bool)

(assert (=> b!456234 (= e!266539 e!266537)))

(declare-fun res!272288 () Bool)

(assert (=> b!456234 (=> (not res!272288) (not e!266537))))

(assert (=> b!456234 (= res!272288 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206332 () array!28323)

(declare-fun minValue!515 () V!17459)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8156 0))(
  ( (tuple2!8157 (_1!4089 (_ BitVec 64)) (_2!4089 V!17459)) )
))
(declare-datatypes ((List!8219 0))(
  ( (Nil!8216) (Cons!8215 (h!9071 tuple2!8156) (t!14038 List!8219)) )
))
(declare-datatypes ((ListLongMap!7059 0))(
  ( (ListLongMap!7060 (toList!3545 List!8219)) )
))
(declare-fun lt!206334 () ListLongMap!7059)

(declare-fun zeroValue!515 () V!17459)

(declare-fun getCurrentListMapNoExtraKeys!1740 (array!28321 array!28323 (_ BitVec 32) (_ BitVec 32) V!17459 V!17459 (_ BitVec 32) Int) ListLongMap!7059)

(assert (=> b!456234 (= lt!206334 (getCurrentListMapNoExtraKeys!1740 lt!206335 lt!206332 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17459)

(assert (=> b!456234 (= lt!206332 (array!28324 (store (arr!13605 _values!549) i!563 (ValueCellFull!5789 v!412)) (size!13958 _values!549)))))

(declare-fun lt!206336 () ListLongMap!7059)

(assert (=> b!456234 (= lt!206336 (getCurrentListMapNoExtraKeys!1740 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456235 () Bool)

(declare-fun res!272294 () Bool)

(assert (=> b!456235 (=> (not res!272294) (not e!266533))))

(assert (=> b!456235 (= res!272294 (or (= (select (arr!13604 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13604 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456236 () Bool)

(declare-fun res!272291 () Bool)

(assert (=> b!456236 (=> (not res!272291) (not e!266533))))

(declare-fun arrayContainsKey!0 (array!28321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456236 (= res!272291 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456237 () Bool)

(assert (=> b!456237 (= e!266537 (not true))))

(declare-fun +!1600 (ListLongMap!7059 tuple2!8156) ListLongMap!7059)

(assert (=> b!456237 (= (getCurrentListMapNoExtraKeys!1740 lt!206335 lt!206332 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1600 (getCurrentListMapNoExtraKeys!1740 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8157 k0!794 v!412)))))

(declare-datatypes ((Unit!13249 0))(
  ( (Unit!13250) )
))
(declare-fun lt!206333 () Unit!13249)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!737 (array!28321 array!28323 (_ BitVec 32) (_ BitVec 32) V!17459 V!17459 (_ BitVec 32) (_ BitVec 64) V!17459 (_ BitVec 32) Int) Unit!13249)

(assert (=> b!456237 (= lt!206333 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40978 res!272284) b!456223))

(assert (= (and b!456223 res!272282) b!456231))

(assert (= (and b!456231 res!272293) b!456222))

(assert (= (and b!456222 res!272290) b!456230))

(assert (= (and b!456230 res!272289) b!456227))

(assert (= (and b!456227 res!272287) b!456229))

(assert (= (and b!456229 res!272286) b!456235))

(assert (= (and b!456235 res!272294) b!456236))

(assert (= (and b!456236 res!272291) b!456226))

(assert (= (and b!456226 res!272285) b!456225))

(assert (= (and b!456225 res!272283) b!456228))

(assert (= (and b!456228 res!272292) b!456234))

(assert (= (and b!456234 res!272288) b!456237))

(assert (= (and b!456224 condMapEmpty!20038) mapIsEmpty!20038))

(assert (= (and b!456224 (not condMapEmpty!20038)) mapNonEmpty!20038))

(get-info :version)

(assert (= (and mapNonEmpty!20038 ((_ is ValueCellFull!5789) mapValue!20038)) b!456232))

(assert (= (and b!456224 ((_ is ValueCellFull!5789) mapDefault!20038)) b!456233))

(assert (= start!40978 b!456224))

(declare-fun m!439211 () Bool)

(assert (=> b!456225 m!439211))

(declare-fun m!439213 () Bool)

(assert (=> b!456229 m!439213))

(declare-fun m!439215 () Bool)

(assert (=> mapNonEmpty!20038 m!439215))

(declare-fun m!439217 () Bool)

(assert (=> b!456234 m!439217))

(declare-fun m!439219 () Bool)

(assert (=> b!456234 m!439219))

(declare-fun m!439221 () Bool)

(assert (=> b!456234 m!439221))

(declare-fun m!439223 () Bool)

(assert (=> b!456226 m!439223))

(declare-fun m!439225 () Bool)

(assert (=> b!456226 m!439225))

(declare-fun m!439227 () Bool)

(assert (=> b!456222 m!439227))

(declare-fun m!439229 () Bool)

(assert (=> start!40978 m!439229))

(declare-fun m!439231 () Bool)

(assert (=> start!40978 m!439231))

(declare-fun m!439233 () Bool)

(assert (=> b!456230 m!439233))

(declare-fun m!439235 () Bool)

(assert (=> b!456223 m!439235))

(declare-fun m!439237 () Bool)

(assert (=> b!456235 m!439237))

(declare-fun m!439239 () Bool)

(assert (=> b!456237 m!439239))

(declare-fun m!439241 () Bool)

(assert (=> b!456237 m!439241))

(assert (=> b!456237 m!439241))

(declare-fun m!439243 () Bool)

(assert (=> b!456237 m!439243))

(declare-fun m!439245 () Bool)

(assert (=> b!456237 m!439245))

(declare-fun m!439247 () Bool)

(assert (=> b!456236 m!439247))

(check-sat (not b!456223) (not b!456226) (not mapNonEmpty!20038) (not b!456229) (not b_next!10927) (not b!456236) (not b!456222) (not b!456234) tp_is_empty!12265 (not b!456225) b_and!19043 (not start!40978) (not b!456237) (not b!456230))
(check-sat b_and!19043 (not b_next!10927))
