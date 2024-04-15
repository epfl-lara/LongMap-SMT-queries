; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41036 () Bool)

(assert start!41036)

(declare-fun b_free!10963 () Bool)

(declare-fun b_next!10963 () Bool)

(assert (=> start!41036 (= b_free!10963 (not b_next!10963))))

(declare-fun tp!38719 () Bool)

(declare-fun b_and!19107 () Bool)

(assert (=> start!41036 (= tp!38719 b_and!19107)))

(declare-fun b!457291 () Bool)

(declare-fun e!267060 () Bool)

(declare-fun tp_is_empty!12301 () Bool)

(assert (=> b!457291 (= e!267060 tp_is_empty!12301)))

(declare-fun b!457292 () Bool)

(declare-fun res!273100 () Bool)

(declare-fun e!267053 () Bool)

(assert (=> b!457292 (=> (not res!273100) (not e!267053))))

(declare-datatypes ((array!28395 0))(
  ( (array!28396 (arr!13640 (Array (_ BitVec 32) (_ BitVec 64))) (size!13993 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28395)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457292 (= res!273100 (or (= (select (arr!13640 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13640 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457293 () Bool)

(declare-fun res!273097 () Bool)

(assert (=> b!457293 (=> (not res!273097) (not e!267053))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28395 (_ BitVec 32)) Bool)

(assert (=> b!457293 (= res!273097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457294 () Bool)

(declare-fun res!273093 () Bool)

(assert (=> b!457294 (=> (not res!273093) (not e!267053))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457294 (= res!273093 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20095 () Bool)

(declare-fun mapRes!20095 () Bool)

(assert (=> mapIsEmpty!20095 mapRes!20095))

(declare-fun b!457295 () Bool)

(declare-fun res!273092 () Bool)

(assert (=> b!457295 (=> (not res!273092) (not e!267053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457295 (= res!273092 (validKeyInArray!0 k0!794))))

(declare-fun b!457290 () Bool)

(declare-fun e!267055 () Bool)

(declare-fun e!267057 () Bool)

(assert (=> b!457290 (= e!267055 (not e!267057))))

(declare-fun res!273105 () Bool)

(assert (=> b!457290 (=> res!273105 e!267057)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!457290 (= res!273105 (not (validKeyInArray!0 (select (arr!13640 _keys!709) from!863))))))

(declare-datatypes ((V!17507 0))(
  ( (V!17508 (val!6195 Int)) )
))
(declare-datatypes ((tuple2!8186 0))(
  ( (tuple2!8187 (_1!4104 (_ BitVec 64)) (_2!4104 V!17507)) )
))
(declare-datatypes ((List!8249 0))(
  ( (Nil!8246) (Cons!8245 (h!9101 tuple2!8186) (t!14082 List!8249)) )
))
(declare-datatypes ((ListLongMap!7089 0))(
  ( (ListLongMap!7090 (toList!3560 List!8249)) )
))
(declare-fun lt!206739 () ListLongMap!7089)

(declare-fun lt!206740 () ListLongMap!7089)

(assert (=> b!457290 (= lt!206739 lt!206740)))

(declare-fun lt!206738 () ListLongMap!7089)

(declare-fun v!412 () V!17507)

(declare-fun +!1614 (ListLongMap!7089 tuple2!8186) ListLongMap!7089)

(assert (=> b!457290 (= lt!206740 (+!1614 lt!206738 (tuple2!8187 k0!794 v!412)))))

(declare-fun minValue!515 () V!17507)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17507)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5807 0))(
  ( (ValueCellFull!5807 (v!8459 V!17507)) (EmptyCell!5807) )
))
(declare-datatypes ((array!28397 0))(
  ( (array!28398 (arr!13641 (Array (_ BitVec 32) ValueCell!5807)) (size!13994 (_ BitVec 32))) )
))
(declare-fun lt!206737 () array!28397)

(declare-fun lt!206742 () array!28395)

(declare-fun getCurrentListMapNoExtraKeys!1755 (array!28395 array!28397 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) Int) ListLongMap!7089)

(assert (=> b!457290 (= lt!206739 (getCurrentListMapNoExtraKeys!1755 lt!206742 lt!206737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28397)

(assert (=> b!457290 (= lt!206738 (getCurrentListMapNoExtraKeys!1755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13277 0))(
  ( (Unit!13278) )
))
(declare-fun lt!206741 () Unit!13277)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 (array!28395 array!28397 (_ BitVec 32) (_ BitVec 32) V!17507 V!17507 (_ BitVec 32) (_ BitVec 64) V!17507 (_ BitVec 32) Int) Unit!13277)

(assert (=> b!457290 (= lt!206741 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!751 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!273096 () Bool)

(assert (=> start!41036 (=> (not res!273096) (not e!267053))))

(assert (=> start!41036 (= res!273096 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13993 _keys!709))))))

(assert (=> start!41036 e!267053))

(assert (=> start!41036 tp_is_empty!12301))

(assert (=> start!41036 tp!38719))

(assert (=> start!41036 true))

(declare-fun e!267059 () Bool)

(declare-fun array_inv!9936 (array!28397) Bool)

(assert (=> start!41036 (and (array_inv!9936 _values!549) e!267059)))

(declare-fun array_inv!9937 (array!28395) Bool)

(assert (=> start!41036 (array_inv!9937 _keys!709)))

(declare-fun mapNonEmpty!20095 () Bool)

(declare-fun tp!38718 () Bool)

(assert (=> mapNonEmpty!20095 (= mapRes!20095 (and tp!38718 e!267060))))

(declare-fun mapValue!20095 () ValueCell!5807)

(declare-fun mapKey!20095 () (_ BitVec 32))

(declare-fun mapRest!20095 () (Array (_ BitVec 32) ValueCell!5807))

(assert (=> mapNonEmpty!20095 (= (arr!13641 _values!549) (store mapRest!20095 mapKey!20095 mapValue!20095))))

(declare-fun b!457296 () Bool)

(declare-fun res!273101 () Bool)

(declare-fun e!267054 () Bool)

(assert (=> b!457296 (=> (not res!273101) (not e!267054))))

(assert (=> b!457296 (= res!273101 (bvsle from!863 i!563))))

(declare-fun b!457297 () Bool)

(declare-fun res!273098 () Bool)

(assert (=> b!457297 (=> (not res!273098) (not e!267053))))

(assert (=> b!457297 (= res!273098 (and (= (size!13994 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13993 _keys!709) (size!13994 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457298 () Bool)

(declare-fun e!267058 () Bool)

(assert (=> b!457298 (= e!267058 tp_is_empty!12301)))

(declare-fun b!457299 () Bool)

(assert (=> b!457299 (= e!267053 e!267054)))

(declare-fun res!273104 () Bool)

(assert (=> b!457299 (=> (not res!273104) (not e!267054))))

(assert (=> b!457299 (= res!273104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206742 mask!1025))))

(assert (=> b!457299 (= lt!206742 (array!28396 (store (arr!13640 _keys!709) i!563 k0!794) (size!13993 _keys!709)))))

(declare-fun b!457300 () Bool)

(declare-fun res!273103 () Bool)

(assert (=> b!457300 (=> (not res!273103) (not e!267054))))

(declare-datatypes ((List!8250 0))(
  ( (Nil!8247) (Cons!8246 (h!9102 (_ BitVec 64)) (t!14083 List!8250)) )
))
(declare-fun arrayNoDuplicates!0 (array!28395 (_ BitVec 32) List!8250) Bool)

(assert (=> b!457300 (= res!273103 (arrayNoDuplicates!0 lt!206742 #b00000000000000000000000000000000 Nil!8247))))

(declare-fun b!457301 () Bool)

(declare-fun res!273099 () Bool)

(assert (=> b!457301 (=> (not res!273099) (not e!267053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457301 (= res!273099 (validMask!0 mask!1025))))

(declare-fun b!457302 () Bool)

(assert (=> b!457302 (= e!267054 e!267055)))

(declare-fun res!273102 () Bool)

(assert (=> b!457302 (=> (not res!273102) (not e!267055))))

(assert (=> b!457302 (= res!273102 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206735 () ListLongMap!7089)

(assert (=> b!457302 (= lt!206735 (getCurrentListMapNoExtraKeys!1755 lt!206742 lt!206737 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!457302 (= lt!206737 (array!28398 (store (arr!13641 _values!549) i!563 (ValueCellFull!5807 v!412)) (size!13994 _values!549)))))

(declare-fun lt!206736 () ListLongMap!7089)

(assert (=> b!457302 (= lt!206736 (getCurrentListMapNoExtraKeys!1755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457303 () Bool)

(assert (=> b!457303 (= e!267057 true)))

(declare-fun get!6716 (ValueCell!5807 V!17507) V!17507)

(declare-fun dynLambda!875 (Int (_ BitVec 64)) V!17507)

(assert (=> b!457303 (= lt!206735 (+!1614 lt!206740 (tuple2!8187 (select (arr!13640 _keys!709) from!863) (get!6716 (select (arr!13641 _values!549) from!863) (dynLambda!875 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457304 () Bool)

(declare-fun res!273095 () Bool)

(assert (=> b!457304 (=> (not res!273095) (not e!267053))))

(assert (=> b!457304 (= res!273095 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13993 _keys!709))))))

(declare-fun b!457305 () Bool)

(assert (=> b!457305 (= e!267059 (and e!267058 mapRes!20095))))

(declare-fun condMapEmpty!20095 () Bool)

(declare-fun mapDefault!20095 () ValueCell!5807)

(assert (=> b!457305 (= condMapEmpty!20095 (= (arr!13641 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5807)) mapDefault!20095)))))

(declare-fun b!457306 () Bool)

(declare-fun res!273094 () Bool)

(assert (=> b!457306 (=> (not res!273094) (not e!267053))))

(assert (=> b!457306 (= res!273094 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8247))))

(assert (= (and start!41036 res!273096) b!457301))

(assert (= (and b!457301 res!273099) b!457297))

(assert (= (and b!457297 res!273098) b!457293))

(assert (= (and b!457293 res!273097) b!457306))

(assert (= (and b!457306 res!273094) b!457304))

(assert (= (and b!457304 res!273095) b!457295))

(assert (= (and b!457295 res!273092) b!457292))

(assert (= (and b!457292 res!273100) b!457294))

(assert (= (and b!457294 res!273093) b!457299))

(assert (= (and b!457299 res!273104) b!457300))

(assert (= (and b!457300 res!273103) b!457296))

(assert (= (and b!457296 res!273101) b!457302))

(assert (= (and b!457302 res!273102) b!457290))

(assert (= (and b!457290 (not res!273105)) b!457303))

(assert (= (and b!457305 condMapEmpty!20095) mapIsEmpty!20095))

(assert (= (and b!457305 (not condMapEmpty!20095)) mapNonEmpty!20095))

(get-info :version)

(assert (= (and mapNonEmpty!20095 ((_ is ValueCellFull!5807) mapValue!20095)) b!457291))

(assert (= (and b!457305 ((_ is ValueCellFull!5807) mapDefault!20095)) b!457298))

(assert (= start!41036 b!457305))

(declare-fun b_lambda!9711 () Bool)

(assert (=> (not b_lambda!9711) (not b!457303)))

(declare-fun t!14081 () Bool)

(declare-fun tb!3791 () Bool)

(assert (=> (and start!41036 (= defaultEntry!557 defaultEntry!557) t!14081) tb!3791))

(declare-fun result!7131 () Bool)

(assert (=> tb!3791 (= result!7131 tp_is_empty!12301)))

(assert (=> b!457303 t!14081))

(declare-fun b_and!19109 () Bool)

(assert (= b_and!19107 (and (=> t!14081 result!7131) b_and!19109)))

(declare-fun m!440177 () Bool)

(assert (=> b!457301 m!440177))

(declare-fun m!440179 () Bool)

(assert (=> mapNonEmpty!20095 m!440179))

(declare-fun m!440181 () Bool)

(assert (=> b!457293 m!440181))

(declare-fun m!440183 () Bool)

(assert (=> b!457303 m!440183))

(declare-fun m!440185 () Bool)

(assert (=> b!457303 m!440185))

(declare-fun m!440187 () Bool)

(assert (=> b!457303 m!440187))

(assert (=> b!457303 m!440185))

(declare-fun m!440189 () Bool)

(assert (=> b!457303 m!440189))

(declare-fun m!440191 () Bool)

(assert (=> b!457303 m!440191))

(assert (=> b!457303 m!440187))

(declare-fun m!440193 () Bool)

(assert (=> b!457306 m!440193))

(declare-fun m!440195 () Bool)

(assert (=> b!457302 m!440195))

(declare-fun m!440197 () Bool)

(assert (=> b!457302 m!440197))

(declare-fun m!440199 () Bool)

(assert (=> b!457302 m!440199))

(declare-fun m!440201 () Bool)

(assert (=> b!457292 m!440201))

(declare-fun m!440203 () Bool)

(assert (=> b!457299 m!440203))

(declare-fun m!440205 () Bool)

(assert (=> b!457299 m!440205))

(declare-fun m!440207 () Bool)

(assert (=> b!457295 m!440207))

(declare-fun m!440209 () Bool)

(assert (=> b!457294 m!440209))

(declare-fun m!440211 () Bool)

(assert (=> start!41036 m!440211))

(declare-fun m!440213 () Bool)

(assert (=> start!41036 m!440213))

(declare-fun m!440215 () Bool)

(assert (=> b!457300 m!440215))

(assert (=> b!457290 m!440183))

(declare-fun m!440217 () Bool)

(assert (=> b!457290 m!440217))

(declare-fun m!440219 () Bool)

(assert (=> b!457290 m!440219))

(declare-fun m!440221 () Bool)

(assert (=> b!457290 m!440221))

(assert (=> b!457290 m!440183))

(declare-fun m!440223 () Bool)

(assert (=> b!457290 m!440223))

(declare-fun m!440225 () Bool)

(assert (=> b!457290 m!440225))

(check-sat b_and!19109 (not b_lambda!9711) (not b!457303) (not b!457306) (not b!457295) tp_is_empty!12301 (not b!457290) (not mapNonEmpty!20095) (not b!457300) (not b!457301) (not b!457294) (not b!457302) (not b!457299) (not start!41036) (not b!457293) (not b_next!10963))
(check-sat b_and!19109 (not b_next!10963))
