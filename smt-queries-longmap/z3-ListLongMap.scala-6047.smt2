; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78204 () Bool)

(assert start!78204)

(declare-fun b_free!16695 () Bool)

(declare-fun b_next!16695 () Bool)

(assert (=> start!78204 (= b_free!16695 (not b_next!16695))))

(declare-fun tp!58362 () Bool)

(declare-fun b_and!27271 () Bool)

(assert (=> start!78204 (= tp!58362 b_and!27271)))

(declare-fun b!912683 () Bool)

(declare-fun res!615674 () Bool)

(declare-fun e!511953 () Bool)

(assert (=> b!912683 (=> (not res!615674) (not e!511953))))

(declare-datatypes ((array!54220 0))(
  ( (array!54221 (arr!26064 (Array (_ BitVec 32) (_ BitVec 64))) (size!26523 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54220)

(declare-datatypes ((List!18306 0))(
  ( (Nil!18303) (Cons!18302 (h!19448 (_ BitVec 64)) (t!25895 List!18306)) )
))
(declare-fun arrayNoDuplicates!0 (array!54220 (_ BitVec 32) List!18306) Bool)

(assert (=> b!912683 (= res!615674 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18303))))

(declare-fun b!912684 () Bool)

(declare-fun res!615670 () Bool)

(assert (=> b!912684 (=> (not res!615670) (not e!511953))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912684 (= res!615670 (and (= (select (arr!26064 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912685 () Bool)

(declare-fun e!511950 () Bool)

(declare-fun tp_is_empty!19113 () Bool)

(assert (=> b!912685 (= e!511950 tp_is_empty!19113)))

(declare-fun b!912687 () Bool)

(declare-fun res!615675 () Bool)

(assert (=> b!912687 (=> (not res!615675) (not e!511953))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912687 (= res!615675 (inRange!0 i!717 mask!1756))))

(declare-fun b!912688 () Bool)

(declare-fun res!615673 () Bool)

(assert (=> b!912688 (=> (not res!615673) (not e!511953))))

(declare-datatypes ((V!30449 0))(
  ( (V!30450 (val!9607 Int)) )
))
(declare-datatypes ((ValueCell!9075 0))(
  ( (ValueCellFull!9075 (v!12118 V!30449)) (EmptyCell!9075) )
))
(declare-datatypes ((array!54222 0))(
  ( (array!54223 (arr!26065 (Array (_ BitVec 32) ValueCell!9075)) (size!26524 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54222)

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30449)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30449)

(declare-datatypes ((tuple2!12516 0))(
  ( (tuple2!12517 (_1!6269 (_ BitVec 64)) (_2!6269 V!30449)) )
))
(declare-datatypes ((List!18307 0))(
  ( (Nil!18304) (Cons!18303 (h!19449 tuple2!12516) (t!25896 List!18307)) )
))
(declare-datatypes ((ListLongMap!11213 0))(
  ( (ListLongMap!11214 (toList!5622 List!18307)) )
))
(declare-fun contains!4668 (ListLongMap!11213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2884 (array!54220 array!54222 (_ BitVec 32) (_ BitVec 32) V!30449 V!30449 (_ BitVec 32) Int) ListLongMap!11213)

(assert (=> b!912688 (= res!615673 (contains!4668 (getCurrentListMap!2884 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912689 () Bool)

(assert (=> b!912689 (= e!511953 (not true))))

(declare-fun arrayContainsKey!0 (array!54220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912689 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30886 0))(
  ( (Unit!30887) )
))
(declare-fun lt!410693 () Unit!30886)

(declare-fun lemmaKeyInListMapIsInArray!268 (array!54220 array!54222 (_ BitVec 32) (_ BitVec 32) V!30449 V!30449 (_ BitVec 64) Int) Unit!30886)

(assert (=> b!912689 (= lt!410693 (lemmaKeyInListMapIsInArray!268 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!30397 () Bool)

(declare-fun mapRes!30397 () Bool)

(assert (=> mapIsEmpty!30397 mapRes!30397))

(declare-fun b!912686 () Bool)

(declare-fun e!511949 () Bool)

(declare-fun e!511952 () Bool)

(assert (=> b!912686 (= e!511949 (and e!511952 mapRes!30397))))

(declare-fun condMapEmpty!30397 () Bool)

(declare-fun mapDefault!30397 () ValueCell!9075)

(assert (=> b!912686 (= condMapEmpty!30397 (= (arr!26065 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9075)) mapDefault!30397)))))

(declare-fun res!615672 () Bool)

(assert (=> start!78204 (=> (not res!615672) (not e!511953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78204 (= res!615672 (validMask!0 mask!1756))))

(assert (=> start!78204 e!511953))

(declare-fun array_inv!20360 (array!54222) Bool)

(assert (=> start!78204 (and (array_inv!20360 _values!1152) e!511949)))

(assert (=> start!78204 tp!58362))

(assert (=> start!78204 true))

(assert (=> start!78204 tp_is_empty!19113))

(declare-fun array_inv!20361 (array!54220) Bool)

(assert (=> start!78204 (array_inv!20361 _keys!1386)))

(declare-fun b!912690 () Bool)

(declare-fun res!615671 () Bool)

(assert (=> b!912690 (=> (not res!615671) (not e!511953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54220 (_ BitVec 32)) Bool)

(assert (=> b!912690 (= res!615671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30397 () Bool)

(declare-fun tp!58361 () Bool)

(assert (=> mapNonEmpty!30397 (= mapRes!30397 (and tp!58361 e!511950))))

(declare-fun mapValue!30397 () ValueCell!9075)

(declare-fun mapRest!30397 () (Array (_ BitVec 32) ValueCell!9075))

(declare-fun mapKey!30397 () (_ BitVec 32))

(assert (=> mapNonEmpty!30397 (= (arr!26065 _values!1152) (store mapRest!30397 mapKey!30397 mapValue!30397))))

(declare-fun b!912691 () Bool)

(declare-fun res!615669 () Bool)

(assert (=> b!912691 (=> (not res!615669) (not e!511953))))

(assert (=> b!912691 (= res!615669 (and (= (size!26524 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26523 _keys!1386) (size!26524 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912692 () Bool)

(assert (=> b!912692 (= e!511952 tp_is_empty!19113)))

(assert (= (and start!78204 res!615672) b!912691))

(assert (= (and b!912691 res!615669) b!912690))

(assert (= (and b!912690 res!615671) b!912683))

(assert (= (and b!912683 res!615674) b!912688))

(assert (= (and b!912688 res!615673) b!912687))

(assert (= (and b!912687 res!615675) b!912684))

(assert (= (and b!912684 res!615670) b!912689))

(assert (= (and b!912686 condMapEmpty!30397) mapIsEmpty!30397))

(assert (= (and b!912686 (not condMapEmpty!30397)) mapNonEmpty!30397))

(get-info :version)

(assert (= (and mapNonEmpty!30397 ((_ is ValueCellFull!9075) mapValue!30397)) b!912685))

(assert (= (and b!912686 ((_ is ValueCellFull!9075) mapDefault!30397)) b!912692))

(assert (= start!78204 b!912686))

(declare-fun m!847139 () Bool)

(assert (=> mapNonEmpty!30397 m!847139))

(declare-fun m!847141 () Bool)

(assert (=> b!912689 m!847141))

(declare-fun m!847143 () Bool)

(assert (=> b!912689 m!847143))

(declare-fun m!847145 () Bool)

(assert (=> b!912688 m!847145))

(assert (=> b!912688 m!847145))

(declare-fun m!847147 () Bool)

(assert (=> b!912688 m!847147))

(declare-fun m!847149 () Bool)

(assert (=> b!912687 m!847149))

(declare-fun m!847151 () Bool)

(assert (=> b!912684 m!847151))

(declare-fun m!847153 () Bool)

(assert (=> start!78204 m!847153))

(declare-fun m!847155 () Bool)

(assert (=> start!78204 m!847155))

(declare-fun m!847157 () Bool)

(assert (=> start!78204 m!847157))

(declare-fun m!847159 () Bool)

(assert (=> b!912690 m!847159))

(declare-fun m!847161 () Bool)

(assert (=> b!912683 m!847161))

(check-sat (not start!78204) (not b!912689) (not b!912688) b_and!27271 (not b!912683) (not b!912687) (not b_next!16695) (not mapNonEmpty!30397) (not b!912690) tp_is_empty!19113)
(check-sat b_and!27271 (not b_next!16695))
