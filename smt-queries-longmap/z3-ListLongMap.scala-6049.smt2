; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78216 () Bool)

(assert start!78216)

(declare-fun b_free!16707 () Bool)

(declare-fun b_next!16707 () Bool)

(assert (=> start!78216 (= b_free!16707 (not b_next!16707))))

(declare-fun tp!58398 () Bool)

(declare-fun b_and!27283 () Bool)

(assert (=> start!78216 (= tp!58398 b_and!27283)))

(declare-fun b!912863 () Bool)

(declare-fun res!615798 () Bool)

(declare-fun e!512041 () Bool)

(assert (=> b!912863 (=> (not res!615798) (not e!512041))))

(declare-datatypes ((array!54242 0))(
  ( (array!54243 (arr!26075 (Array (_ BitVec 32) (_ BitVec 64))) (size!26534 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54242)

(declare-datatypes ((List!18314 0))(
  ( (Nil!18311) (Cons!18310 (h!19456 (_ BitVec 64)) (t!25903 List!18314)) )
))
(declare-fun arrayNoDuplicates!0 (array!54242 (_ BitVec 32) List!18314) Bool)

(assert (=> b!912863 (= res!615798 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18311))))

(declare-fun b!912864 () Bool)

(declare-fun res!615799 () Bool)

(assert (=> b!912864 (=> (not res!615799) (not e!512041))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912864 (= res!615799 (and (= (select (arr!26075 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912865 () Bool)

(declare-fun res!615801 () Bool)

(assert (=> b!912865 (=> (not res!615801) (not e!512041))))

(declare-datatypes ((V!30465 0))(
  ( (V!30466 (val!9613 Int)) )
))
(declare-datatypes ((ValueCell!9081 0))(
  ( (ValueCellFull!9081 (v!12124 V!30465)) (EmptyCell!9081) )
))
(declare-datatypes ((array!54244 0))(
  ( (array!54245 (arr!26076 (Array (_ BitVec 32) ValueCell!9081)) (size!26535 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54244)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!912865 (= res!615801 (and (= (size!26535 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26534 _keys!1386) (size!26535 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912866 () Bool)

(declare-fun e!512042 () Bool)

(declare-fun tp_is_empty!19125 () Bool)

(assert (=> b!912866 (= e!512042 tp_is_empty!19125)))

(declare-fun b!912867 () Bool)

(assert (=> b!912867 (= e!512041 (not true))))

(declare-fun arrayContainsKey!0 (array!54242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912867 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-datatypes ((Unit!30896 0))(
  ( (Unit!30897) )
))
(declare-fun lt!410711 () Unit!30896)

(declare-fun zeroValue!1094 () V!30465)

(declare-fun minValue!1094 () V!30465)

(declare-fun lemmaKeyInListMapIsInArray!273 (array!54242 array!54244 (_ BitVec 32) (_ BitVec 32) V!30465 V!30465 (_ BitVec 64) Int) Unit!30896)

(assert (=> b!912867 (= lt!410711 (lemmaKeyInListMapIsInArray!273 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912868 () Bool)

(declare-fun res!615796 () Bool)

(assert (=> b!912868 (=> (not res!615796) (not e!512041))))

(declare-datatypes ((tuple2!12524 0))(
  ( (tuple2!12525 (_1!6273 (_ BitVec 64)) (_2!6273 V!30465)) )
))
(declare-datatypes ((List!18315 0))(
  ( (Nil!18312) (Cons!18311 (h!19457 tuple2!12524) (t!25904 List!18315)) )
))
(declare-datatypes ((ListLongMap!11221 0))(
  ( (ListLongMap!11222 (toList!5626 List!18315)) )
))
(declare-fun contains!4672 (ListLongMap!11221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2888 (array!54242 array!54244 (_ BitVec 32) (_ BitVec 32) V!30465 V!30465 (_ BitVec 32) Int) ListLongMap!11221)

(assert (=> b!912868 (= res!615796 (contains!4672 (getCurrentListMap!2888 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30415 () Bool)

(declare-fun mapRes!30415 () Bool)

(declare-fun tp!58397 () Bool)

(assert (=> mapNonEmpty!30415 (= mapRes!30415 (and tp!58397 e!512042))))

(declare-fun mapValue!30415 () ValueCell!9081)

(declare-fun mapRest!30415 () (Array (_ BitVec 32) ValueCell!9081))

(declare-fun mapKey!30415 () (_ BitVec 32))

(assert (=> mapNonEmpty!30415 (= (arr!26076 _values!1152) (store mapRest!30415 mapKey!30415 mapValue!30415))))

(declare-fun b!912869 () Bool)

(declare-fun res!615795 () Bool)

(assert (=> b!912869 (=> (not res!615795) (not e!512041))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912869 (= res!615795 (inRange!0 i!717 mask!1756))))

(declare-fun res!615800 () Bool)

(assert (=> start!78216 (=> (not res!615800) (not e!512041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78216 (= res!615800 (validMask!0 mask!1756))))

(assert (=> start!78216 e!512041))

(declare-fun e!512040 () Bool)

(declare-fun array_inv!20368 (array!54244) Bool)

(assert (=> start!78216 (and (array_inv!20368 _values!1152) e!512040)))

(assert (=> start!78216 tp!58398))

(assert (=> start!78216 true))

(assert (=> start!78216 tp_is_empty!19125))

(declare-fun array_inv!20369 (array!54242) Bool)

(assert (=> start!78216 (array_inv!20369 _keys!1386)))

(declare-fun mapIsEmpty!30415 () Bool)

(assert (=> mapIsEmpty!30415 mapRes!30415))

(declare-fun b!912870 () Bool)

(declare-fun res!615797 () Bool)

(assert (=> b!912870 (=> (not res!615797) (not e!512041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54242 (_ BitVec 32)) Bool)

(assert (=> b!912870 (= res!615797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912871 () Bool)

(declare-fun e!512039 () Bool)

(assert (=> b!912871 (= e!512040 (and e!512039 mapRes!30415))))

(declare-fun condMapEmpty!30415 () Bool)

(declare-fun mapDefault!30415 () ValueCell!9081)

(assert (=> b!912871 (= condMapEmpty!30415 (= (arr!26076 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9081)) mapDefault!30415)))))

(declare-fun b!912872 () Bool)

(assert (=> b!912872 (= e!512039 tp_is_empty!19125)))

(assert (= (and start!78216 res!615800) b!912865))

(assert (= (and b!912865 res!615801) b!912870))

(assert (= (and b!912870 res!615797) b!912863))

(assert (= (and b!912863 res!615798) b!912868))

(assert (= (and b!912868 res!615796) b!912869))

(assert (= (and b!912869 res!615795) b!912864))

(assert (= (and b!912864 res!615799) b!912867))

(assert (= (and b!912871 condMapEmpty!30415) mapIsEmpty!30415))

(assert (= (and b!912871 (not condMapEmpty!30415)) mapNonEmpty!30415))

(get-info :version)

(assert (= (and mapNonEmpty!30415 ((_ is ValueCellFull!9081) mapValue!30415)) b!912866))

(assert (= (and b!912871 ((_ is ValueCellFull!9081) mapDefault!30415)) b!912872))

(assert (= start!78216 b!912871))

(declare-fun m!847283 () Bool)

(assert (=> b!912870 m!847283))

(declare-fun m!847285 () Bool)

(assert (=> b!912869 m!847285))

(declare-fun m!847287 () Bool)

(assert (=> b!912868 m!847287))

(assert (=> b!912868 m!847287))

(declare-fun m!847289 () Bool)

(assert (=> b!912868 m!847289))

(declare-fun m!847291 () Bool)

(assert (=> b!912864 m!847291))

(declare-fun m!847293 () Bool)

(assert (=> mapNonEmpty!30415 m!847293))

(declare-fun m!847295 () Bool)

(assert (=> start!78216 m!847295))

(declare-fun m!847297 () Bool)

(assert (=> start!78216 m!847297))

(declare-fun m!847299 () Bool)

(assert (=> start!78216 m!847299))

(declare-fun m!847301 () Bool)

(assert (=> b!912867 m!847301))

(declare-fun m!847303 () Bool)

(assert (=> b!912867 m!847303))

(declare-fun m!847305 () Bool)

(assert (=> b!912863 m!847305))

(check-sat b_and!27283 (not start!78216) (not b!912870) (not b!912868) (not b!912867) (not b!912869) (not mapNonEmpty!30415) tp_is_empty!19125 (not b_next!16707) (not b!912863))
(check-sat b_and!27283 (not b_next!16707))
