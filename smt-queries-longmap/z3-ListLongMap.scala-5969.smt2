; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77622 () Bool)

(assert start!77622)

(declare-fun b_free!16225 () Bool)

(declare-fun b_next!16225 () Bool)

(assert (=> start!77622 (= b_free!16225 (not b_next!16225))))

(declare-fun tp!56937 () Bool)

(declare-fun b_and!26577 () Bool)

(assert (=> start!77622 (= tp!56937 b_and!26577)))

(declare-fun b!904884 () Bool)

(declare-fun res!610657 () Bool)

(declare-fun e!507050 () Bool)

(assert (=> b!904884 (=> (not res!610657) (not e!507050))))

(declare-datatypes ((array!53307 0))(
  ( (array!53308 (arr!25613 (Array (_ BitVec 32) (_ BitVec 64))) (size!26074 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53307)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904884 (= res!610657 (and (= (select (arr!25613 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904885 () Bool)

(declare-fun res!610650 () Bool)

(assert (=> b!904885 (=> (not res!610650) (not e!507050))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904885 (= res!610650 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29677 () Bool)

(declare-fun mapRes!29677 () Bool)

(assert (=> mapIsEmpty!29677 mapRes!29677))

(declare-fun b!904886 () Bool)

(declare-fun res!610659 () Bool)

(declare-fun e!507049 () Bool)

(assert (=> b!904886 (=> res!610659 e!507049)))

(declare-datatypes ((V!29823 0))(
  ( (V!29824 (val!9372 Int)) )
))
(declare-datatypes ((tuple2!12204 0))(
  ( (tuple2!12205 (_1!6113 (_ BitVec 64)) (_2!6113 V!29823)) )
))
(declare-datatypes ((List!18003 0))(
  ( (Nil!18000) (Cons!17999 (h!19145 tuple2!12204) (t!25391 List!18003)) )
))
(declare-datatypes ((ListLongMap!10891 0))(
  ( (ListLongMap!10892 (toList!5461 List!18003)) )
))
(declare-fun lt!408203 () ListLongMap!10891)

(declare-fun lt!408201 () V!29823)

(declare-fun apply!441 (ListLongMap!10891 (_ BitVec 64)) V!29823)

(assert (=> b!904886 (= res!610659 (not (= (apply!441 lt!408203 k0!1033) lt!408201)))))

(declare-fun b!904887 () Bool)

(declare-fun e!507047 () Bool)

(assert (=> b!904887 (= e!507047 e!507050)))

(declare-fun res!610652 () Bool)

(assert (=> b!904887 (=> (not res!610652) (not e!507050))))

(declare-fun lt!408205 () ListLongMap!10891)

(declare-fun contains!4471 (ListLongMap!10891 (_ BitVec 64)) Bool)

(assert (=> b!904887 (= res!610652 (contains!4471 lt!408205 k0!1033))))

(declare-datatypes ((ValueCell!8840 0))(
  ( (ValueCellFull!8840 (v!11876 V!29823)) (EmptyCell!8840) )
))
(declare-datatypes ((array!53309 0))(
  ( (array!53310 (arr!25614 (Array (_ BitVec 32) ValueCell!8840)) (size!26075 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53309)

(declare-fun zeroValue!1094 () V!29823)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29823)

(declare-fun defaultEntry!1160 () Int)

(declare-fun getCurrentListMap!2675 (array!53307 array!53309 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 32) Int) ListLongMap!10891)

(assert (=> b!904887 (= lt!408205 (getCurrentListMap!2675 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!904888 () Bool)

(declare-fun e!507046 () Bool)

(declare-fun e!507052 () Bool)

(assert (=> b!904888 (= e!507046 (and e!507052 mapRes!29677))))

(declare-fun condMapEmpty!29677 () Bool)

(declare-fun mapDefault!29677 () ValueCell!8840)

(assert (=> b!904888 (= condMapEmpty!29677 (= (arr!25614 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8840)) mapDefault!29677)))))

(declare-fun b!904889 () Bool)

(declare-fun tp_is_empty!18643 () Bool)

(assert (=> b!904889 (= e!507052 tp_is_empty!18643)))

(declare-fun b!904891 () Bool)

(declare-fun res!610653 () Bool)

(assert (=> b!904891 (=> (not res!610653) (not e!507047))))

(declare-datatypes ((List!18004 0))(
  ( (Nil!18001) (Cons!18000 (h!19146 (_ BitVec 64)) (t!25392 List!18004)) )
))
(declare-fun arrayNoDuplicates!0 (array!53307 (_ BitVec 32) List!18004) Bool)

(assert (=> b!904891 (= res!610653 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18001))))

(declare-fun b!904892 () Bool)

(declare-fun res!610656 () Bool)

(assert (=> b!904892 (=> (not res!610656) (not e!507047))))

(assert (=> b!904892 (= res!610656 (and (= (size!26075 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26074 _keys!1386) (size!26075 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!904893 () Bool)

(declare-fun e!507051 () Bool)

(assert (=> b!904893 (= e!507051 e!507049)))

(declare-fun res!610651 () Bool)

(assert (=> b!904893 (=> res!610651 e!507049)))

(assert (=> b!904893 (= res!610651 (not (contains!4471 lt!408203 k0!1033)))))

(assert (=> b!904893 (= lt!408203 (getCurrentListMap!2675 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904894 () Bool)

(assert (=> b!904894 (= e!507050 (not e!507051))))

(declare-fun res!610655 () Bool)

(assert (=> b!904894 (=> res!610655 e!507051)))

(assert (=> b!904894 (= res!610655 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26074 _keys!1386))))))

(declare-fun get!13461 (ValueCell!8840 V!29823) V!29823)

(declare-fun dynLambda!1320 (Int (_ BitVec 64)) V!29823)

(assert (=> b!904894 (= lt!408201 (get!13461 (select (arr!25614 _values!1152) i!717) (dynLambda!1320 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904894 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30630 0))(
  ( (Unit!30631) )
))
(declare-fun lt!408204 () Unit!30630)

(declare-fun lemmaKeyInListMapIsInArray!196 (array!53307 array!53309 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 64) Int) Unit!30630)

(assert (=> b!904894 (= lt!408204 (lemmaKeyInListMapIsInArray!196 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904895 () Bool)

(declare-fun res!610658 () Bool)

(assert (=> b!904895 (=> (not res!610658) (not e!507047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53307 (_ BitVec 32)) Bool)

(assert (=> b!904895 (= res!610658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!29677 () Bool)

(declare-fun tp!56938 () Bool)

(declare-fun e!507053 () Bool)

(assert (=> mapNonEmpty!29677 (= mapRes!29677 (and tp!56938 e!507053))))

(declare-fun mapValue!29677 () ValueCell!8840)

(declare-fun mapRest!29677 () (Array (_ BitVec 32) ValueCell!8840))

(declare-fun mapKey!29677 () (_ BitVec 32))

(assert (=> mapNonEmpty!29677 (= (arr!25614 _values!1152) (store mapRest!29677 mapKey!29677 mapValue!29677))))

(declare-fun b!904896 () Bool)

(assert (=> b!904896 (= e!507053 tp_is_empty!18643)))

(declare-fun b!904890 () Bool)

(assert (=> b!904890 (= e!507049 true)))

(assert (=> b!904890 (= (apply!441 lt!408205 k0!1033) lt!408201)))

(declare-fun lt!408202 () Unit!30630)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!5 (array!53307 array!53309 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 64) V!29823 (_ BitVec 32) Int) Unit!30630)

(assert (=> b!904890 (= lt!408202 (lemmaListMapApplyFromThenApplyFromZero!5 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408201 i!717 defaultEntry!1160))))

(declare-fun res!610654 () Bool)

(assert (=> start!77622 (=> (not res!610654) (not e!507047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77622 (= res!610654 (validMask!0 mask!1756))))

(assert (=> start!77622 e!507047))

(declare-fun array_inv!20118 (array!53309) Bool)

(assert (=> start!77622 (and (array_inv!20118 _values!1152) e!507046)))

(assert (=> start!77622 tp!56937))

(assert (=> start!77622 true))

(assert (=> start!77622 tp_is_empty!18643))

(declare-fun array_inv!20119 (array!53307) Bool)

(assert (=> start!77622 (array_inv!20119 _keys!1386)))

(assert (= (and start!77622 res!610654) b!904892))

(assert (= (and b!904892 res!610656) b!904895))

(assert (= (and b!904895 res!610658) b!904891))

(assert (= (and b!904891 res!610653) b!904887))

(assert (= (and b!904887 res!610652) b!904885))

(assert (= (and b!904885 res!610650) b!904884))

(assert (= (and b!904884 res!610657) b!904894))

(assert (= (and b!904894 (not res!610655)) b!904893))

(assert (= (and b!904893 (not res!610651)) b!904886))

(assert (= (and b!904886 (not res!610659)) b!904890))

(assert (= (and b!904888 condMapEmpty!29677) mapIsEmpty!29677))

(assert (= (and b!904888 (not condMapEmpty!29677)) mapNonEmpty!29677))

(get-info :version)

(assert (= (and mapNonEmpty!29677 ((_ is ValueCellFull!8840) mapValue!29677)) b!904896))

(assert (= (and b!904888 ((_ is ValueCellFull!8840) mapDefault!29677)) b!904889))

(assert (= start!77622 b!904888))

(declare-fun b_lambda!13081 () Bool)

(assert (=> (not b_lambda!13081) (not b!904894)))

(declare-fun t!25390 () Bool)

(declare-fun tb!5239 () Bool)

(assert (=> (and start!77622 (= defaultEntry!1160 defaultEntry!1160) t!25390) tb!5239))

(declare-fun result!10281 () Bool)

(assert (=> tb!5239 (= result!10281 tp_is_empty!18643)))

(assert (=> b!904894 t!25390))

(declare-fun b_and!26579 () Bool)

(assert (= b_and!26577 (and (=> t!25390 result!10281) b_and!26579)))

(declare-fun m!839777 () Bool)

(assert (=> b!904891 m!839777))

(declare-fun m!839779 () Bool)

(assert (=> b!904895 m!839779))

(declare-fun m!839781 () Bool)

(assert (=> b!904890 m!839781))

(declare-fun m!839783 () Bool)

(assert (=> b!904890 m!839783))

(declare-fun m!839785 () Bool)

(assert (=> start!77622 m!839785))

(declare-fun m!839787 () Bool)

(assert (=> start!77622 m!839787))

(declare-fun m!839789 () Bool)

(assert (=> start!77622 m!839789))

(declare-fun m!839791 () Bool)

(assert (=> b!904887 m!839791))

(declare-fun m!839793 () Bool)

(assert (=> b!904887 m!839793))

(declare-fun m!839795 () Bool)

(assert (=> mapNonEmpty!29677 m!839795))

(declare-fun m!839797 () Bool)

(assert (=> b!904886 m!839797))

(declare-fun m!839799 () Bool)

(assert (=> b!904884 m!839799))

(declare-fun m!839801 () Bool)

(assert (=> b!904894 m!839801))

(declare-fun m!839803 () Bool)

(assert (=> b!904894 m!839803))

(declare-fun m!839805 () Bool)

(assert (=> b!904894 m!839805))

(declare-fun m!839807 () Bool)

(assert (=> b!904894 m!839807))

(assert (=> b!904894 m!839801))

(assert (=> b!904894 m!839805))

(declare-fun m!839809 () Bool)

(assert (=> b!904894 m!839809))

(declare-fun m!839811 () Bool)

(assert (=> b!904885 m!839811))

(declare-fun m!839813 () Bool)

(assert (=> b!904893 m!839813))

(declare-fun m!839815 () Bool)

(assert (=> b!904893 m!839815))

(check-sat (not b!904886) (not b_lambda!13081) (not b!904895) b_and!26579 (not b!904887) (not mapNonEmpty!29677) (not b!904891) (not b!904885) (not b!904894) (not b!904893) (not start!77622) tp_is_empty!18643 (not b_next!16225) (not b!904890))
(check-sat b_and!26579 (not b_next!16225))
