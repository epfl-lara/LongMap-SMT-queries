; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77592 () Bool)

(assert start!77592)

(declare-fun b_free!16195 () Bool)

(declare-fun b_next!16195 () Bool)

(assert (=> start!77592 (= b_free!16195 (not b_next!16195))))

(declare-fun tp!56848 () Bool)

(declare-fun b_and!26535 () Bool)

(assert (=> start!77592 (= tp!56848 b_and!26535)))

(declare-fun b!904312 () Bool)

(declare-fun e!506713 () Bool)

(declare-fun e!506717 () Bool)

(assert (=> b!904312 (= e!506713 (not e!506717))))

(declare-fun res!610225 () Bool)

(assert (=> b!904312 (=> res!610225 e!506717)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53251 0))(
  ( (array!53252 (arr!25585 (Array (_ BitVec 32) (_ BitVec 64))) (size!26046 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53251)

(assert (=> b!904312 (= res!610225 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26046 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904312 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((V!29783 0))(
  ( (V!29784 (val!9357 Int)) )
))
(declare-datatypes ((ValueCell!8825 0))(
  ( (ValueCellFull!8825 (v!11861 V!29783)) (EmptyCell!8825) )
))
(declare-datatypes ((array!53253 0))(
  ( (array!53254 (arr!25586 (Array (_ BitVec 32) ValueCell!8825)) (size!26047 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53253)

(declare-datatypes ((Unit!30610 0))(
  ( (Unit!30611) )
))
(declare-fun lt!408028 () Unit!30610)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29783)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29783)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lemmaKeyInListMapIsInArray!187 (array!53251 array!53253 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 64) Int) Unit!30610)

(assert (=> b!904312 (= lt!408028 (lemmaKeyInListMapIsInArray!187 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904313 () Bool)

(declare-fun res!610229 () Bool)

(assert (=> b!904313 (=> (not res!610229) (not e!506713))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904313 (= res!610229 (inRange!0 i!717 mask!1756))))

(declare-fun b!904314 () Bool)

(declare-fun e!506712 () Bool)

(assert (=> b!904314 (= e!506717 e!506712)))

(declare-fun res!610228 () Bool)

(assert (=> b!904314 (=> res!610228 e!506712)))

(declare-datatypes ((tuple2!12182 0))(
  ( (tuple2!12183 (_1!6102 (_ BitVec 64)) (_2!6102 V!29783)) )
))
(declare-datatypes ((List!17984 0))(
  ( (Nil!17981) (Cons!17980 (h!19126 tuple2!12182) (t!25358 List!17984)) )
))
(declare-datatypes ((ListLongMap!10869 0))(
  ( (ListLongMap!10870 (toList!5450 List!17984)) )
))
(declare-fun lt!408026 () ListLongMap!10869)

(declare-fun contains!4460 (ListLongMap!10869 (_ BitVec 64)) Bool)

(assert (=> b!904314 (= res!610228 (not (contains!4460 lt!408026 k0!1033)))))

(declare-fun getCurrentListMap!2664 (array!53251 array!53253 (_ BitVec 32) (_ BitVec 32) V!29783 V!29783 (_ BitVec 32) Int) ListLongMap!10869)

(assert (=> b!904314 (= lt!408026 (getCurrentListMap!2664 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904315 () Bool)

(declare-fun e!506711 () Bool)

(declare-fun tp_is_empty!18613 () Bool)

(assert (=> b!904315 (= e!506711 tp_is_empty!18613)))

(declare-fun b!904316 () Bool)

(declare-fun res!610230 () Bool)

(assert (=> b!904316 (=> (not res!610230) (not e!506713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53251 (_ BitVec 32)) Bool)

(assert (=> b!904316 (= res!610230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904317 () Bool)

(declare-fun res!610227 () Bool)

(assert (=> b!904317 (=> (not res!610227) (not e!506713))))

(assert (=> b!904317 (= res!610227 (and (= (size!26047 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26046 _keys!1386) (size!26047 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29632 () Bool)

(declare-fun mapRes!29632 () Bool)

(declare-fun tp!56847 () Bool)

(assert (=> mapNonEmpty!29632 (= mapRes!29632 (and tp!56847 e!506711))))

(declare-fun mapValue!29632 () ValueCell!8825)

(declare-fun mapKey!29632 () (_ BitVec 32))

(declare-fun mapRest!29632 () (Array (_ BitVec 32) ValueCell!8825))

(assert (=> mapNonEmpty!29632 (= (arr!25586 _values!1152) (store mapRest!29632 mapKey!29632 mapValue!29632))))

(declare-fun b!904318 () Bool)

(declare-fun e!506716 () Bool)

(assert (=> b!904318 (= e!506716 tp_is_empty!18613)))

(declare-fun mapIsEmpty!29632 () Bool)

(assert (=> mapIsEmpty!29632 mapRes!29632))

(declare-fun b!904319 () Bool)

(declare-fun res!610232 () Bool)

(assert (=> b!904319 (=> (not res!610232) (not e!506713))))

(assert (=> b!904319 (= res!610232 (and (= (select (arr!25585 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904320 () Bool)

(assert (=> b!904320 (= e!506712 true)))

(declare-fun lt!408027 () V!29783)

(declare-fun apply!432 (ListLongMap!10869 (_ BitVec 64)) V!29783)

(assert (=> b!904320 (= lt!408027 (apply!432 lt!408026 k0!1033))))

(declare-fun b!904321 () Bool)

(declare-fun res!610231 () Bool)

(assert (=> b!904321 (=> (not res!610231) (not e!506713))))

(declare-datatypes ((List!17985 0))(
  ( (Nil!17982) (Cons!17981 (h!19127 (_ BitVec 64)) (t!25359 List!17985)) )
))
(declare-fun arrayNoDuplicates!0 (array!53251 (_ BitVec 32) List!17985) Bool)

(assert (=> b!904321 (= res!610231 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17982))))

(declare-fun b!904322 () Bool)

(declare-fun e!506715 () Bool)

(assert (=> b!904322 (= e!506715 (and e!506716 mapRes!29632))))

(declare-fun condMapEmpty!29632 () Bool)

(declare-fun mapDefault!29632 () ValueCell!8825)

(assert (=> b!904322 (= condMapEmpty!29632 (= (arr!25586 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8825)) mapDefault!29632)))))

(declare-fun b!904323 () Bool)

(declare-fun res!610233 () Bool)

(assert (=> b!904323 (=> (not res!610233) (not e!506713))))

(assert (=> b!904323 (= res!610233 (contains!4460 (getCurrentListMap!2664 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!610226 () Bool)

(assert (=> start!77592 (=> (not res!610226) (not e!506713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77592 (= res!610226 (validMask!0 mask!1756))))

(assert (=> start!77592 e!506713))

(declare-fun array_inv!20106 (array!53253) Bool)

(assert (=> start!77592 (and (array_inv!20106 _values!1152) e!506715)))

(assert (=> start!77592 tp!56848))

(assert (=> start!77592 true))

(assert (=> start!77592 tp_is_empty!18613))

(declare-fun array_inv!20107 (array!53251) Bool)

(assert (=> start!77592 (array_inv!20107 _keys!1386)))

(assert (= (and start!77592 res!610226) b!904317))

(assert (= (and b!904317 res!610227) b!904316))

(assert (= (and b!904316 res!610230) b!904321))

(assert (= (and b!904321 res!610231) b!904323))

(assert (= (and b!904323 res!610233) b!904313))

(assert (= (and b!904313 res!610229) b!904319))

(assert (= (and b!904319 res!610232) b!904312))

(assert (= (and b!904312 (not res!610225)) b!904314))

(assert (= (and b!904314 (not res!610228)) b!904320))

(assert (= (and b!904322 condMapEmpty!29632) mapIsEmpty!29632))

(assert (= (and b!904322 (not condMapEmpty!29632)) mapNonEmpty!29632))

(get-info :version)

(assert (= (and mapNonEmpty!29632 ((_ is ValueCellFull!8825) mapValue!29632)) b!904315))

(assert (= (and b!904322 ((_ is ValueCellFull!8825) mapDefault!29632)) b!904318))

(assert (= start!77592 b!904322))

(declare-fun m!839267 () Bool)

(assert (=> start!77592 m!839267))

(declare-fun m!839269 () Bool)

(assert (=> start!77592 m!839269))

(declare-fun m!839271 () Bool)

(assert (=> start!77592 m!839271))

(declare-fun m!839273 () Bool)

(assert (=> b!904316 m!839273))

(declare-fun m!839275 () Bool)

(assert (=> b!904323 m!839275))

(assert (=> b!904323 m!839275))

(declare-fun m!839277 () Bool)

(assert (=> b!904323 m!839277))

(declare-fun m!839279 () Bool)

(assert (=> b!904319 m!839279))

(declare-fun m!839281 () Bool)

(assert (=> b!904321 m!839281))

(declare-fun m!839283 () Bool)

(assert (=> b!904312 m!839283))

(declare-fun m!839285 () Bool)

(assert (=> b!904312 m!839285))

(declare-fun m!839287 () Bool)

(assert (=> b!904320 m!839287))

(declare-fun m!839289 () Bool)

(assert (=> b!904314 m!839289))

(declare-fun m!839291 () Bool)

(assert (=> b!904314 m!839291))

(declare-fun m!839293 () Bool)

(assert (=> b!904313 m!839293))

(declare-fun m!839295 () Bool)

(assert (=> mapNonEmpty!29632 m!839295))

(check-sat (not b!904312) tp_is_empty!18613 (not b!904313) (not b!904314) b_and!26535 (not b!904323) (not start!77592) (not b_next!16195) (not b!904320) (not b!904321) (not b!904316) (not mapNonEmpty!29632))
(check-sat b_and!26535 (not b_next!16195))
