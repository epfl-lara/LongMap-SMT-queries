; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77594 () Bool)

(assert start!77594)

(declare-fun b_free!16179 () Bool)

(declare-fun b_next!16179 () Bool)

(assert (=> start!77594 (= b_free!16179 (not b_next!16179))))

(declare-fun tp!56799 () Bool)

(declare-fun b_and!26545 () Bool)

(assert (=> start!77594 (= tp!56799 b_and!26545)))

(declare-fun b!904263 () Bool)

(declare-fun res!610125 () Bool)

(declare-fun e!506695 () Bool)

(assert (=> b!904263 (=> (not res!610125) (not e!506695))))

(declare-datatypes ((array!53240 0))(
  ( (array!53241 (arr!25579 (Array (_ BitVec 32) (_ BitVec 64))) (size!26038 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53240)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53240 (_ BitVec 32)) Bool)

(assert (=> b!904263 (= res!610125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904264 () Bool)

(declare-fun e!506692 () Bool)

(declare-fun tp_is_empty!18597 () Bool)

(assert (=> b!904264 (= e!506692 tp_is_empty!18597)))

(declare-fun b!904265 () Bool)

(declare-fun e!506693 () Bool)

(assert (=> b!904265 (= e!506693 tp_is_empty!18597)))

(declare-fun b!904266 () Bool)

(declare-fun res!610120 () Bool)

(assert (=> b!904266 (=> (not res!610120) (not e!506695))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!904266 (= res!610120 (and (= (select (arr!25579 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904267 () Bool)

(declare-fun e!506691 () Bool)

(declare-fun e!506694 () Bool)

(assert (=> b!904267 (= e!506691 e!506694)))

(declare-fun res!610122 () Bool)

(assert (=> b!904267 (=> res!610122 e!506694)))

(declare-datatypes ((V!29761 0))(
  ( (V!29762 (val!9349 Int)) )
))
(declare-datatypes ((tuple2!12144 0))(
  ( (tuple2!12145 (_1!6083 (_ BitVec 64)) (_2!6083 V!29761)) )
))
(declare-datatypes ((List!17962 0))(
  ( (Nil!17959) (Cons!17958 (h!19104 tuple2!12144) (t!25345 List!17962)) )
))
(declare-datatypes ((ListLongMap!10841 0))(
  ( (ListLongMap!10842 (toList!5436 List!17962)) )
))
(declare-fun lt!408190 () ListLongMap!10841)

(declare-fun contains!4484 (ListLongMap!10841 (_ BitVec 64)) Bool)

(assert (=> b!904267 (= res!610122 (not (contains!4484 lt!408190 k0!1033)))))

(declare-datatypes ((ValueCell!8817 0))(
  ( (ValueCellFull!8817 (v!11854 V!29761)) (EmptyCell!8817) )
))
(declare-datatypes ((array!53242 0))(
  ( (array!53243 (arr!25580 (Array (_ BitVec 32) ValueCell!8817)) (size!26039 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53242)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29761)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29761)

(declare-fun getCurrentListMap!2705 (array!53240 array!53242 (_ BitVec 32) (_ BitVec 32) V!29761 V!29761 (_ BitVec 32) Int) ListLongMap!10841)

(assert (=> b!904267 (= lt!408190 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904268 () Bool)

(declare-fun res!610126 () Bool)

(assert (=> b!904268 (=> (not res!610126) (not e!506695))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904268 (= res!610126 (inRange!0 i!717 mask!1756))))

(declare-fun mapNonEmpty!29608 () Bool)

(declare-fun mapRes!29608 () Bool)

(declare-fun tp!56798 () Bool)

(assert (=> mapNonEmpty!29608 (= mapRes!29608 (and tp!56798 e!506692))))

(declare-fun mapValue!29608 () ValueCell!8817)

(declare-fun mapKey!29608 () (_ BitVec 32))

(declare-fun mapRest!29608 () (Array (_ BitVec 32) ValueCell!8817))

(assert (=> mapNonEmpty!29608 (= (arr!25580 _values!1152) (store mapRest!29608 mapKey!29608 mapValue!29608))))

(declare-fun b!904269 () Bool)

(assert (=> b!904269 (= e!506694 true)))

(declare-fun lt!408192 () V!29761)

(declare-fun apply!433 (ListLongMap!10841 (_ BitVec 64)) V!29761)

(assert (=> b!904269 (= lt!408192 (apply!433 lt!408190 k0!1033))))

(declare-fun b!904270 () Bool)

(declare-fun res!610127 () Bool)

(assert (=> b!904270 (=> (not res!610127) (not e!506695))))

(declare-datatypes ((List!17963 0))(
  ( (Nil!17960) (Cons!17959 (h!19105 (_ BitVec 64)) (t!25346 List!17963)) )
))
(declare-fun arrayNoDuplicates!0 (array!53240 (_ BitVec 32) List!17963) Bool)

(assert (=> b!904270 (= res!610127 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17960))))

(declare-fun mapIsEmpty!29608 () Bool)

(assert (=> mapIsEmpty!29608 mapRes!29608))

(declare-fun b!904271 () Bool)

(declare-fun res!610121 () Bool)

(assert (=> b!904271 (=> (not res!610121) (not e!506695))))

(assert (=> b!904271 (= res!610121 (and (= (size!26039 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26038 _keys!1386) (size!26039 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904272 () Bool)

(declare-fun res!610119 () Bool)

(assert (=> b!904272 (=> (not res!610119) (not e!506695))))

(assert (=> b!904272 (= res!610119 (contains!4484 (getCurrentListMap!2705 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!610124 () Bool)

(assert (=> start!77594 (=> (not res!610124) (not e!506695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77594 (= res!610124 (validMask!0 mask!1756))))

(assert (=> start!77594 e!506695))

(declare-fun e!506697 () Bool)

(declare-fun array_inv!20042 (array!53242) Bool)

(assert (=> start!77594 (and (array_inv!20042 _values!1152) e!506697)))

(assert (=> start!77594 tp!56799))

(assert (=> start!77594 true))

(assert (=> start!77594 tp_is_empty!18597))

(declare-fun array_inv!20043 (array!53240) Bool)

(assert (=> start!77594 (array_inv!20043 _keys!1386)))

(declare-fun b!904273 () Bool)

(assert (=> b!904273 (= e!506695 (not e!506691))))

(declare-fun res!610123 () Bool)

(assert (=> b!904273 (=> res!610123 e!506691)))

(assert (=> b!904273 (= res!610123 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26038 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904273 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30668 0))(
  ( (Unit!30669) )
))
(declare-fun lt!408191 () Unit!30668)

(declare-fun lemmaKeyInListMapIsInArray!177 (array!53240 array!53242 (_ BitVec 32) (_ BitVec 32) V!29761 V!29761 (_ BitVec 64) Int) Unit!30668)

(assert (=> b!904273 (= lt!408191 (lemmaKeyInListMapIsInArray!177 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904274 () Bool)

(assert (=> b!904274 (= e!506697 (and e!506693 mapRes!29608))))

(declare-fun condMapEmpty!29608 () Bool)

(declare-fun mapDefault!29608 () ValueCell!8817)

(assert (=> b!904274 (= condMapEmpty!29608 (= (arr!25580 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8817)) mapDefault!29608)))))

(assert (= (and start!77594 res!610124) b!904271))

(assert (= (and b!904271 res!610121) b!904263))

(assert (= (and b!904263 res!610125) b!904270))

(assert (= (and b!904270 res!610127) b!904272))

(assert (= (and b!904272 res!610119) b!904268))

(assert (= (and b!904268 res!610126) b!904266))

(assert (= (and b!904266 res!610120) b!904273))

(assert (= (and b!904273 (not res!610123)) b!904267))

(assert (= (and b!904267 (not res!610122)) b!904269))

(assert (= (and b!904274 condMapEmpty!29608) mapIsEmpty!29608))

(assert (= (and b!904274 (not condMapEmpty!29608)) mapNonEmpty!29608))

(get-info :version)

(assert (= (and mapNonEmpty!29608 ((_ is ValueCellFull!8817) mapValue!29608)) b!904264))

(assert (= (and b!904274 ((_ is ValueCellFull!8817) mapDefault!29608)) b!904265))

(assert (= start!77594 b!904274))

(declare-fun m!839785 () Bool)

(assert (=> b!904270 m!839785))

(declare-fun m!839787 () Bool)

(assert (=> b!904269 m!839787))

(declare-fun m!839789 () Bool)

(assert (=> b!904266 m!839789))

(declare-fun m!839791 () Bool)

(assert (=> b!904272 m!839791))

(assert (=> b!904272 m!839791))

(declare-fun m!839793 () Bool)

(assert (=> b!904272 m!839793))

(declare-fun m!839795 () Bool)

(assert (=> b!904268 m!839795))

(declare-fun m!839797 () Bool)

(assert (=> mapNonEmpty!29608 m!839797))

(declare-fun m!839799 () Bool)

(assert (=> start!77594 m!839799))

(declare-fun m!839801 () Bool)

(assert (=> start!77594 m!839801))

(declare-fun m!839803 () Bool)

(assert (=> start!77594 m!839803))

(declare-fun m!839805 () Bool)

(assert (=> b!904263 m!839805))

(declare-fun m!839807 () Bool)

(assert (=> b!904273 m!839807))

(declare-fun m!839809 () Bool)

(assert (=> b!904273 m!839809))

(declare-fun m!839811 () Bool)

(assert (=> b!904267 m!839811))

(declare-fun m!839813 () Bool)

(assert (=> b!904267 m!839813))

(check-sat tp_is_empty!18597 (not b!904270) (not mapNonEmpty!29608) (not b_next!16179) b_and!26545 (not b!904269) (not b!904267) (not b!904268) (not b!904273) (not start!77594) (not b!904263) (not b!904272))
(check-sat b_and!26545 (not b_next!16179))
