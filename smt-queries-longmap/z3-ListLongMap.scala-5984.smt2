; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77732 () Bool)

(assert start!77732)

(declare-fun b_free!16317 () Bool)

(declare-fun b_next!16317 () Bool)

(assert (=> start!77732 (= b_free!16317 (not b_next!16317))))

(declare-fun tp!57213 () Bool)

(declare-fun b_and!26787 () Bool)

(assert (=> start!77732 (= tp!57213 b_and!26787)))

(declare-fun res!612146 () Bool)

(declare-fun e!508305 () Bool)

(assert (=> start!77732 (=> (not res!612146) (not e!508305))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77732 (= res!612146 (validMask!0 mask!1756))))

(assert (=> start!77732 e!508305))

(declare-datatypes ((V!29945 0))(
  ( (V!29946 (val!9418 Int)) )
))
(declare-datatypes ((ValueCell!8886 0))(
  ( (ValueCellFull!8886 (v!11923 V!29945)) (EmptyCell!8886) )
))
(declare-datatypes ((array!53508 0))(
  ( (array!53509 (arr!25713 (Array (_ BitVec 32) ValueCell!8886)) (size!26172 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53508)

(declare-fun e!508298 () Bool)

(declare-fun array_inv!20142 (array!53508) Bool)

(assert (=> start!77732 (and (array_inv!20142 _values!1152) e!508298)))

(assert (=> start!77732 tp!57213))

(assert (=> start!77732 true))

(declare-fun tp_is_empty!18735 () Bool)

(assert (=> start!77732 tp_is_empty!18735))

(declare-datatypes ((array!53510 0))(
  ( (array!53511 (arr!25714 (Array (_ BitVec 32) (_ BitVec 64))) (size!26173 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53510)

(declare-fun array_inv!20143 (array!53510) Bool)

(assert (=> start!77732 (array_inv!20143 _keys!1386)))

(declare-fun mapNonEmpty!29815 () Bool)

(declare-fun mapRes!29815 () Bool)

(declare-fun tp!57212 () Bool)

(declare-fun e!508304 () Bool)

(assert (=> mapNonEmpty!29815 (= mapRes!29815 (and tp!57212 e!508304))))

(declare-fun mapValue!29815 () ValueCell!8886)

(declare-fun mapKey!29815 () (_ BitVec 32))

(declare-fun mapRest!29815 () (Array (_ BitVec 32) ValueCell!8886))

(assert (=> mapNonEmpty!29815 (= (arr!25713 _values!1152) (store mapRest!29815 mapKey!29815 mapValue!29815))))

(declare-fun b!907009 () Bool)

(declare-fun res!612142 () Bool)

(assert (=> b!907009 (=> (not res!612142) (not e!508305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53510 (_ BitVec 32)) Bool)

(assert (=> b!907009 (= res!612142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907010 () Bool)

(declare-fun res!612145 () Bool)

(assert (=> b!907010 (=> (not res!612145) (not e!508305))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!907010 (= res!612145 (and (= (size!26172 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26173 _keys!1386) (size!26172 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907011 () Bool)

(assert (=> b!907011 (= e!508304 tp_is_empty!18735)))

(declare-fun b!907012 () Bool)

(declare-fun e!508303 () Bool)

(declare-fun e!508300 () Bool)

(assert (=> b!907012 (= e!508303 e!508300)))

(declare-fun res!612148 () Bool)

(assert (=> b!907012 (=> res!612148 e!508300)))

(declare-datatypes ((tuple2!12264 0))(
  ( (tuple2!12265 (_1!6143 (_ BitVec 64)) (_2!6143 V!29945)) )
))
(declare-datatypes ((List!18066 0))(
  ( (Nil!18063) (Cons!18062 (h!19208 tuple2!12264) (t!25555 List!18066)) )
))
(declare-datatypes ((ListLongMap!10961 0))(
  ( (ListLongMap!10962 (toList!5496 List!18066)) )
))
(declare-fun lt!409129 () ListLongMap!10961)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4541 (ListLongMap!10961 (_ BitVec 64)) Bool)

(assert (=> b!907012 (= res!612148 (not (contains!4541 lt!409129 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29945)

(declare-fun minValue!1094 () V!29945)

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2762 (array!53510 array!53508 (_ BitVec 32) (_ BitVec 32) V!29945 V!29945 (_ BitVec 32) Int) ListLongMap!10961)

(assert (=> b!907012 (= lt!409129 (getCurrentListMap!2762 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29815 () Bool)

(assert (=> mapIsEmpty!29815 mapRes!29815))

(declare-fun b!907013 () Bool)

(declare-fun res!612141 () Bool)

(assert (=> b!907013 (=> res!612141 e!508300)))

(declare-fun lt!409127 () V!29945)

(declare-fun apply!481 (ListLongMap!10961 (_ BitVec 64)) V!29945)

(assert (=> b!907013 (= res!612141 (not (= (apply!481 lt!409129 k0!1033) lt!409127)))))

(declare-fun b!907014 () Bool)

(declare-fun e!508299 () Bool)

(assert (=> b!907014 (= e!508299 tp_is_empty!18735)))

(declare-fun b!907015 () Bool)

(assert (=> b!907015 (= e!508300 true)))

(declare-fun lt!409130 () ListLongMap!10961)

(assert (=> b!907015 (= (apply!481 lt!409130 k0!1033) lt!409127)))

(declare-datatypes ((Unit!30784 0))(
  ( (Unit!30785) )
))
(declare-fun lt!409131 () Unit!30784)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!35 (array!53510 array!53508 (_ BitVec 32) (_ BitVec 32) V!29945 V!29945 (_ BitVec 64) V!29945 (_ BitVec 32) Int) Unit!30784)

(assert (=> b!907015 (= lt!409131 (lemmaListMapApplyFromThenApplyFromZero!35 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409127 i!717 defaultEntry!1160))))

(declare-fun b!907016 () Bool)

(declare-fun e!508302 () Bool)

(assert (=> b!907016 (= e!508305 e!508302)))

(declare-fun res!612147 () Bool)

(assert (=> b!907016 (=> (not res!612147) (not e!508302))))

(assert (=> b!907016 (= res!612147 (contains!4541 lt!409130 k0!1033))))

(assert (=> b!907016 (= lt!409130 (getCurrentListMap!2762 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907017 () Bool)

(declare-fun res!612140 () Bool)

(assert (=> b!907017 (=> (not res!612140) (not e!508302))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907017 (= res!612140 (inRange!0 i!717 mask!1756))))

(declare-fun b!907018 () Bool)

(declare-fun res!612149 () Bool)

(assert (=> b!907018 (=> (not res!612149) (not e!508305))))

(declare-datatypes ((List!18067 0))(
  ( (Nil!18064) (Cons!18063 (h!19209 (_ BitVec 64)) (t!25556 List!18067)) )
))
(declare-fun arrayNoDuplicates!0 (array!53510 (_ BitVec 32) List!18067) Bool)

(assert (=> b!907018 (= res!612149 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18064))))

(declare-fun b!907019 () Bool)

(assert (=> b!907019 (= e!508302 (not e!508303))))

(declare-fun res!612144 () Bool)

(assert (=> b!907019 (=> res!612144 e!508303)))

(assert (=> b!907019 (= res!612144 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26173 _keys!1386))))))

(declare-fun get!13524 (ValueCell!8886 V!29945) V!29945)

(declare-fun dynLambda!1358 (Int (_ BitVec 64)) V!29945)

(assert (=> b!907019 (= lt!409127 (get!13524 (select (arr!25713 _values!1152) i!717) (dynLambda!1358 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907019 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409128 () Unit!30784)

(declare-fun lemmaKeyInListMapIsInArray!230 (array!53510 array!53508 (_ BitVec 32) (_ BitVec 32) V!29945 V!29945 (_ BitVec 64) Int) Unit!30784)

(assert (=> b!907019 (= lt!409128 (lemmaKeyInListMapIsInArray!230 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907020 () Bool)

(assert (=> b!907020 (= e!508298 (and e!508299 mapRes!29815))))

(declare-fun condMapEmpty!29815 () Bool)

(declare-fun mapDefault!29815 () ValueCell!8886)

(assert (=> b!907020 (= condMapEmpty!29815 (= (arr!25713 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8886)) mapDefault!29815)))))

(declare-fun b!907021 () Bool)

(declare-fun res!612143 () Bool)

(assert (=> b!907021 (=> (not res!612143) (not e!508302))))

(assert (=> b!907021 (= res!612143 (and (= (select (arr!25714 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77732 res!612146) b!907010))

(assert (= (and b!907010 res!612145) b!907009))

(assert (= (and b!907009 res!612142) b!907018))

(assert (= (and b!907018 res!612149) b!907016))

(assert (= (and b!907016 res!612147) b!907017))

(assert (= (and b!907017 res!612140) b!907021))

(assert (= (and b!907021 res!612143) b!907019))

(assert (= (and b!907019 (not res!612144)) b!907012))

(assert (= (and b!907012 (not res!612148)) b!907013))

(assert (= (and b!907013 (not res!612141)) b!907015))

(assert (= (and b!907020 condMapEmpty!29815) mapIsEmpty!29815))

(assert (= (and b!907020 (not condMapEmpty!29815)) mapNonEmpty!29815))

(get-info :version)

(assert (= (and mapNonEmpty!29815 ((_ is ValueCellFull!8886) mapValue!29815)) b!907011))

(assert (= (and b!907020 ((_ is ValueCellFull!8886) mapDefault!29815)) b!907014))

(assert (= start!77732 b!907020))

(declare-fun b_lambda!13191 () Bool)

(assert (=> (not b_lambda!13191) (not b!907019)))

(declare-fun t!25554 () Bool)

(declare-fun tb!5339 () Bool)

(assert (=> (and start!77732 (= defaultEntry!1160 defaultEntry!1160) t!25554) tb!5339))

(declare-fun result!10473 () Bool)

(assert (=> tb!5339 (= result!10473 tp_is_empty!18735)))

(assert (=> b!907019 t!25554))

(declare-fun b_and!26789 () Bool)

(assert (= b_and!26787 (and (=> t!25554 result!10473) b_and!26789)))

(declare-fun m!842375 () Bool)

(assert (=> b!907016 m!842375))

(declare-fun m!842377 () Bool)

(assert (=> b!907016 m!842377))

(declare-fun m!842379 () Bool)

(assert (=> b!907019 m!842379))

(declare-fun m!842381 () Bool)

(assert (=> b!907019 m!842381))

(declare-fun m!842383 () Bool)

(assert (=> b!907019 m!842383))

(declare-fun m!842385 () Bool)

(assert (=> b!907019 m!842385))

(assert (=> b!907019 m!842379))

(assert (=> b!907019 m!842383))

(declare-fun m!842387 () Bool)

(assert (=> b!907019 m!842387))

(declare-fun m!842389 () Bool)

(assert (=> b!907013 m!842389))

(declare-fun m!842391 () Bool)

(assert (=> b!907017 m!842391))

(declare-fun m!842393 () Bool)

(assert (=> b!907012 m!842393))

(declare-fun m!842395 () Bool)

(assert (=> b!907012 m!842395))

(declare-fun m!842397 () Bool)

(assert (=> b!907018 m!842397))

(declare-fun m!842399 () Bool)

(assert (=> mapNonEmpty!29815 m!842399))

(declare-fun m!842401 () Bool)

(assert (=> b!907021 m!842401))

(declare-fun m!842403 () Bool)

(assert (=> b!907009 m!842403))

(declare-fun m!842405 () Bool)

(assert (=> b!907015 m!842405))

(declare-fun m!842407 () Bool)

(assert (=> b!907015 m!842407))

(declare-fun m!842409 () Bool)

(assert (=> start!77732 m!842409))

(declare-fun m!842411 () Bool)

(assert (=> start!77732 m!842411))

(declare-fun m!842413 () Bool)

(assert (=> start!77732 m!842413))

(check-sat tp_is_empty!18735 (not b!907017) (not b!907016) (not b_next!16317) (not b!907013) (not b!907019) (not b!907018) (not mapNonEmpty!29815) (not b!907009) b_and!26789 (not b!907015) (not start!77732) (not b_lambda!13191) (not b!907012))
(check-sat b_and!26789 (not b_next!16317))
