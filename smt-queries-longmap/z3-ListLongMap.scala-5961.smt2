; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77760 () Bool)

(assert start!77760)

(declare-fun b_free!16177 () Bool)

(declare-fun b_next!16177 () Bool)

(assert (=> start!77760 (= b_free!16177 (not b_next!16177))))

(declare-fun tp!56794 () Bool)

(declare-fun b_and!26553 () Bool)

(assert (=> start!77760 (= tp!56794 b_and!26553)))

(declare-fun b!905130 () Bool)

(declare-fun e!507256 () Bool)

(declare-fun tp_is_empty!18595 () Bool)

(assert (=> b!905130 (= e!507256 tp_is_empty!18595)))

(declare-fun b!905131 () Bool)

(declare-fun res!610440 () Bool)

(declare-fun e!507254 () Bool)

(assert (=> b!905131 (=> (not res!610440) (not e!507254))))

(declare-datatypes ((V!29759 0))(
  ( (V!29760 (val!9348 Int)) )
))
(declare-datatypes ((ValueCell!8816 0))(
  ( (ValueCellFull!8816 (v!11850 V!29759)) (EmptyCell!8816) )
))
(declare-datatypes ((array!53281 0))(
  ( (array!53282 (arr!25595 (Array (_ BitVec 32) ValueCell!8816)) (size!26055 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53281)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53283 0))(
  ( (array!53284 (arr!25596 (Array (_ BitVec 32) (_ BitVec 64))) (size!26056 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53283)

(assert (=> b!905131 (= res!610440 (and (= (size!26055 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26056 _keys!1386) (size!26055 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!610436 () Bool)

(assert (=> start!77760 (=> (not res!610436) (not e!507254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77760 (= res!610436 (validMask!0 mask!1756))))

(assert (=> start!77760 e!507254))

(declare-fun e!507258 () Bool)

(declare-fun array_inv!20116 (array!53281) Bool)

(assert (=> start!77760 (and (array_inv!20116 _values!1152) e!507258)))

(assert (=> start!77760 tp!56794))

(assert (=> start!77760 true))

(assert (=> start!77760 tp_is_empty!18595))

(declare-fun array_inv!20117 (array!53283) Bool)

(assert (=> start!77760 (array_inv!20117 _keys!1386)))

(declare-fun b!905132 () Bool)

(declare-fun e!507252 () Bool)

(assert (=> b!905132 (= e!507254 (not e!507252))))

(declare-fun res!610441 () Bool)

(assert (=> b!905132 (=> res!610441 e!507252)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!905132 (= res!610441 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26056 _keys!1386))))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905132 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29759)

(declare-datatypes ((Unit!30670 0))(
  ( (Unit!30671) )
))
(declare-fun lt!408543 () Unit!30670)

(declare-fun minValue!1094 () V!29759)

(declare-fun lemmaKeyInListMapIsInArray!182 (array!53283 array!53281 (_ BitVec 32) (_ BitVec 32) V!29759 V!29759 (_ BitVec 64) Int) Unit!30670)

(assert (=> b!905132 (= lt!408543 (lemmaKeyInListMapIsInArray!182 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905133 () Bool)

(declare-fun res!610442 () Bool)

(assert (=> b!905133 (=> (not res!610442) (not e!507254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53283 (_ BitVec 32)) Bool)

(assert (=> b!905133 (= res!610442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905134 () Bool)

(declare-fun e!507253 () Bool)

(assert (=> b!905134 (= e!507252 e!507253)))

(declare-fun res!610438 () Bool)

(assert (=> b!905134 (=> res!610438 e!507253)))

(declare-datatypes ((tuple2!12076 0))(
  ( (tuple2!12077 (_1!6049 (_ BitVec 64)) (_2!6049 V!29759)) )
))
(declare-datatypes ((List!17927 0))(
  ( (Nil!17924) (Cons!17923 (h!19075 tuple2!12076) (t!25302 List!17927)) )
))
(declare-datatypes ((ListLongMap!10775 0))(
  ( (ListLongMap!10776 (toList!5403 List!17927)) )
))
(declare-fun lt!408542 () ListLongMap!10775)

(declare-fun contains!4460 (ListLongMap!10775 (_ BitVec 64)) Bool)

(assert (=> b!905134 (= res!610438 (not (contains!4460 lt!408542 k0!1033)))))

(declare-fun getCurrentListMap!2671 (array!53283 array!53281 (_ BitVec 32) (_ BitVec 32) V!29759 V!29759 (_ BitVec 32) Int) ListLongMap!10775)

(assert (=> b!905134 (= lt!408542 (getCurrentListMap!2671 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905135 () Bool)

(assert (=> b!905135 (= e!507253 true)))

(declare-fun lt!408544 () V!29759)

(declare-fun apply!431 (ListLongMap!10775 (_ BitVec 64)) V!29759)

(assert (=> b!905135 (= lt!408544 (apply!431 lt!408542 k0!1033))))

(declare-fun b!905136 () Bool)

(declare-fun res!610444 () Bool)

(assert (=> b!905136 (=> (not res!610444) (not e!507254))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905136 (= res!610444 (inRange!0 i!717 mask!1756))))

(declare-fun b!905137 () Bool)

(declare-fun e!507255 () Bool)

(declare-fun mapRes!29605 () Bool)

(assert (=> b!905137 (= e!507258 (and e!507255 mapRes!29605))))

(declare-fun condMapEmpty!29605 () Bool)

(declare-fun mapDefault!29605 () ValueCell!8816)

(assert (=> b!905137 (= condMapEmpty!29605 (= (arr!25595 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8816)) mapDefault!29605)))))

(declare-fun mapIsEmpty!29605 () Bool)

(assert (=> mapIsEmpty!29605 mapRes!29605))

(declare-fun b!905138 () Bool)

(declare-fun res!610439 () Bool)

(assert (=> b!905138 (=> (not res!610439) (not e!507254))))

(assert (=> b!905138 (= res!610439 (contains!4460 (getCurrentListMap!2671 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!905139 () Bool)

(declare-fun res!610437 () Bool)

(assert (=> b!905139 (=> (not res!610437) (not e!507254))))

(declare-datatypes ((List!17928 0))(
  ( (Nil!17925) (Cons!17924 (h!19076 (_ BitVec 64)) (t!25303 List!17928)) )
))
(declare-fun arrayNoDuplicates!0 (array!53283 (_ BitVec 32) List!17928) Bool)

(assert (=> b!905139 (= res!610437 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17925))))

(declare-fun b!905140 () Bool)

(declare-fun res!610443 () Bool)

(assert (=> b!905140 (=> (not res!610443) (not e!507254))))

(assert (=> b!905140 (= res!610443 (and (= (select (arr!25596 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905141 () Bool)

(assert (=> b!905141 (= e!507255 tp_is_empty!18595)))

(declare-fun mapNonEmpty!29605 () Bool)

(declare-fun tp!56793 () Bool)

(assert (=> mapNonEmpty!29605 (= mapRes!29605 (and tp!56793 e!507256))))

(declare-fun mapRest!29605 () (Array (_ BitVec 32) ValueCell!8816))

(declare-fun mapKey!29605 () (_ BitVec 32))

(declare-fun mapValue!29605 () ValueCell!8816)

(assert (=> mapNonEmpty!29605 (= (arr!25595 _values!1152) (store mapRest!29605 mapKey!29605 mapValue!29605))))

(assert (= (and start!77760 res!610436) b!905131))

(assert (= (and b!905131 res!610440) b!905133))

(assert (= (and b!905133 res!610442) b!905139))

(assert (= (and b!905139 res!610437) b!905138))

(assert (= (and b!905138 res!610439) b!905136))

(assert (= (and b!905136 res!610444) b!905140))

(assert (= (and b!905140 res!610443) b!905132))

(assert (= (and b!905132 (not res!610441)) b!905134))

(assert (= (and b!905134 (not res!610438)) b!905135))

(assert (= (and b!905137 condMapEmpty!29605) mapIsEmpty!29605))

(assert (= (and b!905137 (not condMapEmpty!29605)) mapNonEmpty!29605))

(get-info :version)

(assert (= (and mapNonEmpty!29605 ((_ is ValueCellFull!8816) mapValue!29605)) b!905130))

(assert (= (and b!905137 ((_ is ValueCellFull!8816) mapDefault!29605)) b!905141))

(assert (= start!77760 b!905137))

(declare-fun m!841049 () Bool)

(assert (=> b!905138 m!841049))

(assert (=> b!905138 m!841049))

(declare-fun m!841051 () Bool)

(assert (=> b!905138 m!841051))

(declare-fun m!841053 () Bool)

(assert (=> b!905134 m!841053))

(declare-fun m!841055 () Bool)

(assert (=> b!905134 m!841055))

(declare-fun m!841057 () Bool)

(assert (=> b!905135 m!841057))

(declare-fun m!841059 () Bool)

(assert (=> b!905133 m!841059))

(declare-fun m!841061 () Bool)

(assert (=> b!905132 m!841061))

(declare-fun m!841063 () Bool)

(assert (=> b!905132 m!841063))

(declare-fun m!841065 () Bool)

(assert (=> b!905139 m!841065))

(declare-fun m!841067 () Bool)

(assert (=> b!905136 m!841067))

(declare-fun m!841069 () Bool)

(assert (=> start!77760 m!841069))

(declare-fun m!841071 () Bool)

(assert (=> start!77760 m!841071))

(declare-fun m!841073 () Bool)

(assert (=> start!77760 m!841073))

(declare-fun m!841075 () Bool)

(assert (=> mapNonEmpty!29605 m!841075))

(declare-fun m!841077 () Bool)

(assert (=> b!905140 m!841077))

(check-sat (not start!77760) (not b!905133) (not mapNonEmpty!29605) (not b!905136) b_and!26553 (not b!905135) tp_is_empty!18595 (not b!905132) (not b!905139) (not b!905138) (not b!905134) (not b_next!16177))
(check-sat b_and!26553 (not b_next!16177))
