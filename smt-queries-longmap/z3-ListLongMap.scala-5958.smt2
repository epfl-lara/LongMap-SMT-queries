; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77742 () Bool)

(assert start!77742)

(declare-fun b_free!16159 () Bool)

(declare-fun b_next!16159 () Bool)

(assert (=> start!77742 (= b_free!16159 (not b_next!16159))))

(declare-fun tp!56740 () Bool)

(declare-fun b_and!26535 () Bool)

(assert (=> start!77742 (= tp!56740 b_and!26535)))

(declare-fun b!904806 () Bool)

(declare-fun res!610195 () Bool)

(declare-fun e!507067 () Bool)

(assert (=> b!904806 (=> (not res!610195) (not e!507067))))

(declare-datatypes ((V!29735 0))(
  ( (V!29736 (val!9339 Int)) )
))
(declare-datatypes ((ValueCell!8807 0))(
  ( (ValueCellFull!8807 (v!11841 V!29735)) (EmptyCell!8807) )
))
(declare-datatypes ((array!53245 0))(
  ( (array!53246 (arr!25577 (Array (_ BitVec 32) ValueCell!8807)) (size!26037 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53245)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29735)

(declare-datatypes ((array!53247 0))(
  ( (array!53248 (arr!25578 (Array (_ BitVec 32) (_ BitVec 64))) (size!26038 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53247)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29735)

(declare-datatypes ((tuple2!12062 0))(
  ( (tuple2!12063 (_1!6042 (_ BitVec 64)) (_2!6042 V!29735)) )
))
(declare-datatypes ((List!17913 0))(
  ( (Nil!17910) (Cons!17909 (h!19061 tuple2!12062) (t!25288 List!17913)) )
))
(declare-datatypes ((ListLongMap!10761 0))(
  ( (ListLongMap!10762 (toList!5396 List!17913)) )
))
(declare-fun contains!4454 (ListLongMap!10761 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2665 (array!53247 array!53245 (_ BitVec 32) (_ BitVec 32) V!29735 V!29735 (_ BitVec 32) Int) ListLongMap!10761)

(assert (=> b!904806 (= res!610195 (contains!4454 (getCurrentListMap!2665 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904807 () Bool)

(declare-fun e!507068 () Bool)

(assert (=> b!904807 (= e!507068 true)))

(declare-fun lt!408463 () V!29735)

(declare-fun lt!408461 () ListLongMap!10761)

(declare-fun apply!424 (ListLongMap!10761 (_ BitVec 64)) V!29735)

(assert (=> b!904807 (= lt!408463 (apply!424 lt!408461 k0!1033))))

(declare-fun b!904808 () Bool)

(declare-fun e!507065 () Bool)

(declare-fun e!507066 () Bool)

(declare-fun mapRes!29578 () Bool)

(assert (=> b!904808 (= e!507065 (and e!507066 mapRes!29578))))

(declare-fun condMapEmpty!29578 () Bool)

(declare-fun mapDefault!29578 () ValueCell!8807)

(assert (=> b!904808 (= condMapEmpty!29578 (= (arr!25577 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8807)) mapDefault!29578)))))

(declare-fun b!904809 () Bool)

(declare-fun res!610197 () Bool)

(assert (=> b!904809 (=> (not res!610197) (not e!507067))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!904809 (= res!610197 (and (= (select (arr!25578 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!904810 () Bool)

(declare-fun res!610198 () Bool)

(assert (=> b!904810 (=> (not res!610198) (not e!507067))))

(declare-datatypes ((List!17914 0))(
  ( (Nil!17911) (Cons!17910 (h!19062 (_ BitVec 64)) (t!25289 List!17914)) )
))
(declare-fun arrayNoDuplicates!0 (array!53247 (_ BitVec 32) List!17914) Bool)

(assert (=> b!904810 (= res!610198 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17911))))

(declare-fun b!904811 () Bool)

(declare-fun tp_is_empty!18577 () Bool)

(assert (=> b!904811 (= e!507066 tp_is_empty!18577)))

(declare-fun b!904812 () Bool)

(declare-fun e!507064 () Bool)

(assert (=> b!904812 (= e!507064 e!507068)))

(declare-fun res!610196 () Bool)

(assert (=> b!904812 (=> res!610196 e!507068)))

(assert (=> b!904812 (= res!610196 (not (contains!4454 lt!408461 k0!1033)))))

(assert (=> b!904812 (= lt!408461 (getCurrentListMap!2665 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!904813 () Bool)

(declare-fun res!610199 () Bool)

(assert (=> b!904813 (=> (not res!610199) (not e!507067))))

(assert (=> b!904813 (= res!610199 (and (= (size!26037 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26038 _keys!1386) (size!26037 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29578 () Bool)

(declare-fun tp!56739 () Bool)

(declare-fun e!507069 () Bool)

(assert (=> mapNonEmpty!29578 (= mapRes!29578 (and tp!56739 e!507069))))

(declare-fun mapRest!29578 () (Array (_ BitVec 32) ValueCell!8807))

(declare-fun mapValue!29578 () ValueCell!8807)

(declare-fun mapKey!29578 () (_ BitVec 32))

(assert (=> mapNonEmpty!29578 (= (arr!25577 _values!1152) (store mapRest!29578 mapKey!29578 mapValue!29578))))

(declare-fun b!904814 () Bool)

(assert (=> b!904814 (= e!507069 tp_is_empty!18577)))

(declare-fun b!904815 () Bool)

(declare-fun res!610194 () Bool)

(assert (=> b!904815 (=> (not res!610194) (not e!507067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53247 (_ BitVec 32)) Bool)

(assert (=> b!904815 (= res!610194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!904816 () Bool)

(assert (=> b!904816 (= e!507067 (not e!507064))))

(declare-fun res!610193 () Bool)

(assert (=> b!904816 (=> res!610193 e!507064)))

(assert (=> b!904816 (= res!610193 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26038 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!904816 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30656 0))(
  ( (Unit!30657) )
))
(declare-fun lt!408462 () Unit!30656)

(declare-fun lemmaKeyInListMapIsInArray!175 (array!53247 array!53245 (_ BitVec 32) (_ BitVec 32) V!29735 V!29735 (_ BitVec 64) Int) Unit!30656)

(assert (=> b!904816 (= lt!408462 (lemmaKeyInListMapIsInArray!175 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!904817 () Bool)

(declare-fun res!610200 () Bool)

(assert (=> b!904817 (=> (not res!610200) (not e!507067))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!904817 (= res!610200 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29578 () Bool)

(assert (=> mapIsEmpty!29578 mapRes!29578))

(declare-fun res!610201 () Bool)

(assert (=> start!77742 (=> (not res!610201) (not e!507067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77742 (= res!610201 (validMask!0 mask!1756))))

(assert (=> start!77742 e!507067))

(declare-fun array_inv!20106 (array!53245) Bool)

(assert (=> start!77742 (and (array_inv!20106 _values!1152) e!507065)))

(assert (=> start!77742 tp!56740))

(assert (=> start!77742 true))

(assert (=> start!77742 tp_is_empty!18577))

(declare-fun array_inv!20107 (array!53247) Bool)

(assert (=> start!77742 (array_inv!20107 _keys!1386)))

(assert (= (and start!77742 res!610201) b!904813))

(assert (= (and b!904813 res!610199) b!904815))

(assert (= (and b!904815 res!610194) b!904810))

(assert (= (and b!904810 res!610198) b!904806))

(assert (= (and b!904806 res!610195) b!904817))

(assert (= (and b!904817 res!610200) b!904809))

(assert (= (and b!904809 res!610197) b!904816))

(assert (= (and b!904816 (not res!610193)) b!904812))

(assert (= (and b!904812 (not res!610196)) b!904807))

(assert (= (and b!904808 condMapEmpty!29578) mapIsEmpty!29578))

(assert (= (and b!904808 (not condMapEmpty!29578)) mapNonEmpty!29578))

(get-info :version)

(assert (= (and mapNonEmpty!29578 ((_ is ValueCellFull!8807) mapValue!29578)) b!904814))

(assert (= (and b!904808 ((_ is ValueCellFull!8807) mapDefault!29578)) b!904811))

(assert (= start!77742 b!904808))

(declare-fun m!840779 () Bool)

(assert (=> b!904809 m!840779))

(declare-fun m!840781 () Bool)

(assert (=> b!904816 m!840781))

(declare-fun m!840783 () Bool)

(assert (=> b!904816 m!840783))

(declare-fun m!840785 () Bool)

(assert (=> b!904807 m!840785))

(declare-fun m!840787 () Bool)

(assert (=> b!904810 m!840787))

(declare-fun m!840789 () Bool)

(assert (=> b!904806 m!840789))

(assert (=> b!904806 m!840789))

(declare-fun m!840791 () Bool)

(assert (=> b!904806 m!840791))

(declare-fun m!840793 () Bool)

(assert (=> mapNonEmpty!29578 m!840793))

(declare-fun m!840795 () Bool)

(assert (=> b!904817 m!840795))

(declare-fun m!840797 () Bool)

(assert (=> b!904812 m!840797))

(declare-fun m!840799 () Bool)

(assert (=> b!904812 m!840799))

(declare-fun m!840801 () Bool)

(assert (=> b!904815 m!840801))

(declare-fun m!840803 () Bool)

(assert (=> start!77742 m!840803))

(declare-fun m!840805 () Bool)

(assert (=> start!77742 m!840805))

(declare-fun m!840807 () Bool)

(assert (=> start!77742 m!840807))

(check-sat (not start!77742) (not b!904816) (not b!904817) tp_is_empty!18577 (not b!904807) (not b!904810) (not mapNonEmpty!29578) (not b_next!16159) (not b!904806) (not b!904812) b_and!26535 (not b!904815))
(check-sat b_and!26535 (not b_next!16159))
