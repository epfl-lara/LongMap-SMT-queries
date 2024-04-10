; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78378 () Bool)

(assert start!78378)

(declare-fun b_free!16743 () Bool)

(declare-fun b_next!16743 () Bool)

(assert (=> start!78378 (= b_free!16743 (not b_next!16743))))

(declare-fun tp!58516 () Bool)

(declare-fun b_and!27353 () Bool)

(assert (=> start!78378 (= tp!58516 b_and!27353)))

(declare-fun b!914244 () Bool)

(declare-fun res!616564 () Bool)

(declare-fun e!512872 () Bool)

(assert (=> b!914244 (=> (not res!616564) (not e!512872))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54316 0))(
  ( (array!54317 (arr!26109 (Array (_ BitVec 32) (_ BitVec 64))) (size!26568 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54316)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!914244 (= res!616564 (and (= (select (arr!26109 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914245 () Bool)

(declare-fun e!512866 () Bool)

(declare-fun tp_is_empty!19161 () Bool)

(assert (=> b!914245 (= e!512866 tp_is_empty!19161)))

(declare-fun b!914246 () Bool)

(declare-fun res!616566 () Bool)

(declare-fun e!512867 () Bool)

(assert (=> b!914246 (=> res!616566 e!512867)))

(declare-datatypes ((V!30513 0))(
  ( (V!30514 (val!9631 Int)) )
))
(declare-fun lt!411419 () V!30513)

(declare-datatypes ((tuple2!12554 0))(
  ( (tuple2!12555 (_1!6288 (_ BitVec 64)) (_2!6288 V!30513)) )
))
(declare-datatypes ((List!18342 0))(
  ( (Nil!18339) (Cons!18338 (h!19484 tuple2!12554) (t!25945 List!18342)) )
))
(declare-datatypes ((ListLongMap!11251 0))(
  ( (ListLongMap!11252 (toList!5641 List!18342)) )
))
(declare-fun lt!411417 () ListLongMap!11251)

(declare-fun apply!519 (ListLongMap!11251 (_ BitVec 64)) V!30513)

(assert (=> b!914246 (= res!616566 (not (= (apply!519 lt!411417 k0!1033) lt!411419)))))

(declare-fun mapNonEmpty!30480 () Bool)

(declare-fun mapRes!30480 () Bool)

(declare-fun tp!58517 () Bool)

(assert (=> mapNonEmpty!30480 (= mapRes!30480 (and tp!58517 e!512866))))

(declare-datatypes ((ValueCell!9099 0))(
  ( (ValueCellFull!9099 (v!12147 V!30513)) (EmptyCell!9099) )
))
(declare-datatypes ((array!54318 0))(
  ( (array!54319 (arr!26110 (Array (_ BitVec 32) ValueCell!9099)) (size!26569 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54318)

(declare-fun mapRest!30480 () (Array (_ BitVec 32) ValueCell!9099))

(declare-fun mapKey!30480 () (_ BitVec 32))

(declare-fun mapValue!30480 () ValueCell!9099)

(assert (=> mapNonEmpty!30480 (= (arr!26110 _values!1152) (store mapRest!30480 mapKey!30480 mapValue!30480))))

(declare-fun b!914247 () Bool)

(declare-fun res!616565 () Bool)

(declare-fun e!512869 () Bool)

(assert (=> b!914247 (=> (not res!616565) (not e!512869))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54316 (_ BitVec 32)) Bool)

(assert (=> b!914247 (= res!616565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!616562 () Bool)

(assert (=> start!78378 (=> (not res!616562) (not e!512869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78378 (= res!616562 (validMask!0 mask!1756))))

(assert (=> start!78378 e!512869))

(declare-fun e!512868 () Bool)

(declare-fun array_inv!20390 (array!54318) Bool)

(assert (=> start!78378 (and (array_inv!20390 _values!1152) e!512868)))

(assert (=> start!78378 tp!58516))

(assert (=> start!78378 true))

(assert (=> start!78378 tp_is_empty!19161))

(declare-fun array_inv!20391 (array!54316) Bool)

(assert (=> start!78378 (array_inv!20391 _keys!1386)))

(declare-fun b!914248 () Bool)

(declare-fun e!512871 () Bool)

(assert (=> b!914248 (= e!512872 (not e!512871))))

(declare-fun res!616570 () Bool)

(assert (=> b!914248 (=> res!616570 e!512871)))

(assert (=> b!914248 (= res!616570 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26568 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13713 (ValueCell!9099 V!30513) V!30513)

(declare-fun dynLambda!1396 (Int (_ BitVec 64)) V!30513)

(assert (=> b!914248 (= lt!411419 (get!13713 (select (arr!26110 _values!1152) i!717) (dynLambda!1396 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914248 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30950 0))(
  ( (Unit!30951) )
))
(declare-fun lt!411418 () Unit!30950)

(declare-fun zeroValue!1094 () V!30513)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30513)

(declare-fun lemmaKeyInListMapIsInArray!287 (array!54316 array!54318 (_ BitVec 32) (_ BitVec 32) V!30513 V!30513 (_ BitVec 64) Int) Unit!30950)

(assert (=> b!914248 (= lt!411418 (lemmaKeyInListMapIsInArray!287 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!914249 () Bool)

(assert (=> b!914249 (= e!512869 e!512872)))

(declare-fun res!616563 () Bool)

(assert (=> b!914249 (=> (not res!616563) (not e!512872))))

(declare-fun lt!411416 () ListLongMap!11251)

(declare-fun contains!4691 (ListLongMap!11251 (_ BitVec 64)) Bool)

(assert (=> b!914249 (= res!616563 (contains!4691 lt!411416 k0!1033))))

(declare-fun getCurrentListMap!2902 (array!54316 array!54318 (_ BitVec 32) (_ BitVec 32) V!30513 V!30513 (_ BitVec 32) Int) ListLongMap!11251)

(assert (=> b!914249 (= lt!411416 (getCurrentListMap!2902 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914250 () Bool)

(declare-fun e!512870 () Bool)

(assert (=> b!914250 (= e!512868 (and e!512870 mapRes!30480))))

(declare-fun condMapEmpty!30480 () Bool)

(declare-fun mapDefault!30480 () ValueCell!9099)

(assert (=> b!914250 (= condMapEmpty!30480 (= (arr!26110 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9099)) mapDefault!30480)))))

(declare-fun b!914251 () Bool)

(assert (=> b!914251 (= e!512871 e!512867)))

(declare-fun res!616571 () Bool)

(assert (=> b!914251 (=> res!616571 e!512867)))

(assert (=> b!914251 (= res!616571 (not (contains!4691 lt!411417 k0!1033)))))

(assert (=> b!914251 (= lt!411417 (getCurrentListMap!2902 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!914252 () Bool)

(declare-fun res!616568 () Bool)

(assert (=> b!914252 (=> (not res!616568) (not e!512872))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914252 (= res!616568 (inRange!0 i!717 mask!1756))))

(declare-fun b!914253 () Bool)

(declare-fun res!616569 () Bool)

(assert (=> b!914253 (=> (not res!616569) (not e!512869))))

(declare-datatypes ((List!18343 0))(
  ( (Nil!18340) (Cons!18339 (h!19485 (_ BitVec 64)) (t!25946 List!18343)) )
))
(declare-fun arrayNoDuplicates!0 (array!54316 (_ BitVec 32) List!18343) Bool)

(assert (=> b!914253 (= res!616569 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18340))))

(declare-fun b!914254 () Bool)

(assert (=> b!914254 (= e!512867 (bvslt i!717 (size!26569 _values!1152)))))

(assert (=> b!914254 (= (apply!519 lt!411416 k0!1033) lt!411419)))

(declare-fun lt!411420 () Unit!30950)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!62 (array!54316 array!54318 (_ BitVec 32) (_ BitVec 32) V!30513 V!30513 (_ BitVec 64) V!30513 (_ BitVec 32) Int) Unit!30950)

(assert (=> b!914254 (= lt!411420 (lemmaListMapApplyFromThenApplyFromZero!62 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411419 i!717 defaultEntry!1160))))

(declare-fun b!914255 () Bool)

(assert (=> b!914255 (= e!512870 tp_is_empty!19161)))

(declare-fun b!914256 () Bool)

(declare-fun res!616567 () Bool)

(assert (=> b!914256 (=> (not res!616567) (not e!512869))))

(assert (=> b!914256 (= res!616567 (and (= (size!26569 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26568 _keys!1386) (size!26569 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30480 () Bool)

(assert (=> mapIsEmpty!30480 mapRes!30480))

(assert (= (and start!78378 res!616562) b!914256))

(assert (= (and b!914256 res!616567) b!914247))

(assert (= (and b!914247 res!616565) b!914253))

(assert (= (and b!914253 res!616569) b!914249))

(assert (= (and b!914249 res!616563) b!914252))

(assert (= (and b!914252 res!616568) b!914244))

(assert (= (and b!914244 res!616564) b!914248))

(assert (= (and b!914248 (not res!616570)) b!914251))

(assert (= (and b!914251 (not res!616571)) b!914246))

(assert (= (and b!914246 (not res!616566)) b!914254))

(assert (= (and b!914250 condMapEmpty!30480) mapIsEmpty!30480))

(assert (= (and b!914250 (not condMapEmpty!30480)) mapNonEmpty!30480))

(get-info :version)

(assert (= (and mapNonEmpty!30480 ((_ is ValueCellFull!9099) mapValue!30480)) b!914245))

(assert (= (and b!914250 ((_ is ValueCellFull!9099) mapDefault!30480)) b!914255))

(assert (= start!78378 b!914250))

(declare-fun b_lambda!13373 () Bool)

(assert (=> (not b_lambda!13373) (not b!914248)))

(declare-fun t!25944 () Bool)

(declare-fun tb!5453 () Bool)

(assert (=> (and start!78378 (= defaultEntry!1160 defaultEntry!1160) t!25944) tb!5453))

(declare-fun result!10717 () Bool)

(assert (=> tb!5453 (= result!10717 tp_is_empty!19161)))

(assert (=> b!914248 t!25944))

(declare-fun b_and!27355 () Bool)

(assert (= b_and!27353 (and (=> t!25944 result!10717) b_and!27355)))

(declare-fun m!848975 () Bool)

(assert (=> b!914249 m!848975))

(declare-fun m!848977 () Bool)

(assert (=> b!914249 m!848977))

(declare-fun m!848979 () Bool)

(assert (=> b!914247 m!848979))

(declare-fun m!848981 () Bool)

(assert (=> b!914251 m!848981))

(declare-fun m!848983 () Bool)

(assert (=> b!914251 m!848983))

(declare-fun m!848985 () Bool)

(assert (=> b!914246 m!848985))

(declare-fun m!848987 () Bool)

(assert (=> b!914248 m!848987))

(declare-fun m!848989 () Bool)

(assert (=> b!914248 m!848989))

(declare-fun m!848991 () Bool)

(assert (=> b!914248 m!848991))

(declare-fun m!848993 () Bool)

(assert (=> b!914248 m!848993))

(assert (=> b!914248 m!848987))

(assert (=> b!914248 m!848991))

(declare-fun m!848995 () Bool)

(assert (=> b!914248 m!848995))

(declare-fun m!848997 () Bool)

(assert (=> start!78378 m!848997))

(declare-fun m!848999 () Bool)

(assert (=> start!78378 m!848999))

(declare-fun m!849001 () Bool)

(assert (=> start!78378 m!849001))

(declare-fun m!849003 () Bool)

(assert (=> b!914252 m!849003))

(declare-fun m!849005 () Bool)

(assert (=> b!914254 m!849005))

(declare-fun m!849007 () Bool)

(assert (=> b!914254 m!849007))

(declare-fun m!849009 () Bool)

(assert (=> b!914253 m!849009))

(declare-fun m!849011 () Bool)

(assert (=> b!914244 m!849011))

(declare-fun m!849013 () Bool)

(assert (=> mapNonEmpty!30480 m!849013))

(check-sat (not b!914254) (not mapNonEmpty!30480) (not start!78378) b_and!27355 (not b!914249) tp_is_empty!19161 (not b!914251) (not b!914247) (not b_next!16743) (not b!914253) (not b!914246) (not b_lambda!13373) (not b!914252) (not b!914248))
(check-sat b_and!27355 (not b_next!16743))
