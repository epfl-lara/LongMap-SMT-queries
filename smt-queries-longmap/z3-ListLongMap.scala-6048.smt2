; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78210 () Bool)

(assert start!78210)

(declare-fun b_free!16701 () Bool)

(declare-fun b_next!16701 () Bool)

(assert (=> start!78210 (= b_free!16701 (not b_next!16701))))

(declare-fun tp!58380 () Bool)

(declare-fun b_and!27277 () Bool)

(assert (=> start!78210 (= tp!58380 b_and!27277)))

(declare-fun b!912773 () Bool)

(declare-fun res!615733 () Bool)

(declare-fun e!511994 () Bool)

(assert (=> b!912773 (=> (not res!615733) (not e!511994))))

(declare-datatypes ((array!54232 0))(
  ( (array!54233 (arr!26070 (Array (_ BitVec 32) (_ BitVec 64))) (size!26529 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54232)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54232 (_ BitVec 32)) Bool)

(assert (=> b!912773 (= res!615733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912774 () Bool)

(declare-fun e!511995 () Bool)

(declare-fun tp_is_empty!19119 () Bool)

(assert (=> b!912774 (= e!511995 tp_is_empty!19119)))

(declare-fun b!912775 () Bool)

(declare-fun res!615736 () Bool)

(assert (=> b!912775 (=> (not res!615736) (not e!511994))))

(declare-datatypes ((List!18310 0))(
  ( (Nil!18307) (Cons!18306 (h!19452 (_ BitVec 64)) (t!25899 List!18310)) )
))
(declare-fun arrayNoDuplicates!0 (array!54232 (_ BitVec 32) List!18310) Bool)

(assert (=> b!912775 (= res!615736 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18307))))

(declare-fun b!912776 () Bool)

(declare-fun res!615732 () Bool)

(assert (=> b!912776 (=> (not res!615732) (not e!511994))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912776 (= res!615732 (and (= (select (arr!26070 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912777 () Bool)

(declare-fun res!615737 () Bool)

(assert (=> b!912777 (=> (not res!615737) (not e!511994))))

(declare-datatypes ((V!30457 0))(
  ( (V!30458 (val!9610 Int)) )
))
(declare-datatypes ((ValueCell!9078 0))(
  ( (ValueCellFull!9078 (v!12121 V!30457)) (EmptyCell!9078) )
))
(declare-datatypes ((array!54234 0))(
  ( (array!54235 (arr!26071 (Array (_ BitVec 32) ValueCell!9078)) (size!26530 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54234)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912777 (= res!615737 (and (= (size!26530 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26529 _keys!1386) (size!26530 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912778 () Bool)

(assert (=> b!912778 (= e!511994 (not true))))

(declare-fun arrayContainsKey!0 (array!54232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912778 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30457)

(declare-fun minValue!1094 () V!30457)

(declare-datatypes ((Unit!30892 0))(
  ( (Unit!30893) )
))
(declare-fun lt!410702 () Unit!30892)

(declare-fun lemmaKeyInListMapIsInArray!271 (array!54232 array!54234 (_ BitVec 32) (_ BitVec 32) V!30457 V!30457 (_ BitVec 64) Int) Unit!30892)

(assert (=> b!912778 (= lt!410702 (lemmaKeyInListMapIsInArray!271 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912779 () Bool)

(declare-fun e!511997 () Bool)

(declare-fun mapRes!30406 () Bool)

(assert (=> b!912779 (= e!511997 (and e!511995 mapRes!30406))))

(declare-fun condMapEmpty!30406 () Bool)

(declare-fun mapDefault!30406 () ValueCell!9078)

(assert (=> b!912779 (= condMapEmpty!30406 (= (arr!26071 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9078)) mapDefault!30406)))))

(declare-fun b!912780 () Bool)

(declare-fun e!511998 () Bool)

(assert (=> b!912780 (= e!511998 tp_is_empty!19119)))

(declare-fun mapNonEmpty!30406 () Bool)

(declare-fun tp!58379 () Bool)

(assert (=> mapNonEmpty!30406 (= mapRes!30406 (and tp!58379 e!511998))))

(declare-fun mapKey!30406 () (_ BitVec 32))

(declare-fun mapValue!30406 () ValueCell!9078)

(declare-fun mapRest!30406 () (Array (_ BitVec 32) ValueCell!9078))

(assert (=> mapNonEmpty!30406 (= (arr!26071 _values!1152) (store mapRest!30406 mapKey!30406 mapValue!30406))))

(declare-fun b!912782 () Bool)

(declare-fun res!615734 () Bool)

(assert (=> b!912782 (=> (not res!615734) (not e!511994))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912782 (= res!615734 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30406 () Bool)

(assert (=> mapIsEmpty!30406 mapRes!30406))

(declare-fun res!615735 () Bool)

(assert (=> start!78210 (=> (not res!615735) (not e!511994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78210 (= res!615735 (validMask!0 mask!1756))))

(assert (=> start!78210 e!511994))

(declare-fun array_inv!20364 (array!54234) Bool)

(assert (=> start!78210 (and (array_inv!20364 _values!1152) e!511997)))

(assert (=> start!78210 tp!58380))

(assert (=> start!78210 true))

(assert (=> start!78210 tp_is_empty!19119))

(declare-fun array_inv!20365 (array!54232) Bool)

(assert (=> start!78210 (array_inv!20365 _keys!1386)))

(declare-fun b!912781 () Bool)

(declare-fun res!615738 () Bool)

(assert (=> b!912781 (=> (not res!615738) (not e!511994))))

(declare-datatypes ((tuple2!12520 0))(
  ( (tuple2!12521 (_1!6271 (_ BitVec 64)) (_2!6271 V!30457)) )
))
(declare-datatypes ((List!18311 0))(
  ( (Nil!18308) (Cons!18307 (h!19453 tuple2!12520) (t!25900 List!18311)) )
))
(declare-datatypes ((ListLongMap!11217 0))(
  ( (ListLongMap!11218 (toList!5624 List!18311)) )
))
(declare-fun contains!4670 (ListLongMap!11217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2886 (array!54232 array!54234 (_ BitVec 32) (_ BitVec 32) V!30457 V!30457 (_ BitVec 32) Int) ListLongMap!11217)

(assert (=> b!912781 (= res!615738 (contains!4670 (getCurrentListMap!2886 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78210 res!615735) b!912777))

(assert (= (and b!912777 res!615737) b!912773))

(assert (= (and b!912773 res!615733) b!912775))

(assert (= (and b!912775 res!615736) b!912781))

(assert (= (and b!912781 res!615738) b!912782))

(assert (= (and b!912782 res!615734) b!912776))

(assert (= (and b!912776 res!615732) b!912778))

(assert (= (and b!912779 condMapEmpty!30406) mapIsEmpty!30406))

(assert (= (and b!912779 (not condMapEmpty!30406)) mapNonEmpty!30406))

(get-info :version)

(assert (= (and mapNonEmpty!30406 ((_ is ValueCellFull!9078) mapValue!30406)) b!912780))

(assert (= (and b!912779 ((_ is ValueCellFull!9078) mapDefault!30406)) b!912774))

(assert (= start!78210 b!912779))

(declare-fun m!847211 () Bool)

(assert (=> b!912781 m!847211))

(assert (=> b!912781 m!847211))

(declare-fun m!847213 () Bool)

(assert (=> b!912781 m!847213))

(declare-fun m!847215 () Bool)

(assert (=> start!78210 m!847215))

(declare-fun m!847217 () Bool)

(assert (=> start!78210 m!847217))

(declare-fun m!847219 () Bool)

(assert (=> start!78210 m!847219))

(declare-fun m!847221 () Bool)

(assert (=> b!912773 m!847221))

(declare-fun m!847223 () Bool)

(assert (=> b!912778 m!847223))

(declare-fun m!847225 () Bool)

(assert (=> b!912778 m!847225))

(declare-fun m!847227 () Bool)

(assert (=> b!912775 m!847227))

(declare-fun m!847229 () Bool)

(assert (=> b!912782 m!847229))

(declare-fun m!847231 () Bool)

(assert (=> mapNonEmpty!30406 m!847231))

(declare-fun m!847233 () Bool)

(assert (=> b!912776 m!847233))

(check-sat (not b_next!16701) (not b!912782) (not b!912778) (not b!912773) (not b!912781) (not b!912775) (not start!78210) b_and!27277 tp_is_empty!19119 (not mapNonEmpty!30406))
(check-sat b_and!27277 (not b_next!16701))
