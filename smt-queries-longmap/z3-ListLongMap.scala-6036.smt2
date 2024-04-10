; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78118 () Bool)

(assert start!78118)

(declare-fun b_free!16629 () Bool)

(declare-fun b_next!16629 () Bool)

(assert (=> start!78118 (= b_free!16629 (not b_next!16629))))

(declare-fun tp!58160 () Bool)

(declare-fun b_and!27203 () Bool)

(assert (=> start!78118 (= tp!58160 b_and!27203)))

(declare-fun mapIsEmpty!30295 () Bool)

(declare-fun mapRes!30295 () Bool)

(assert (=> mapIsEmpty!30295 mapRes!30295))

(declare-fun b!911746 () Bool)

(declare-fun res!615101 () Bool)

(declare-fun e!511376 () Bool)

(assert (=> b!911746 (=> (not res!615101) (not e!511376))))

(declare-datatypes ((V!30361 0))(
  ( (V!30362 (val!9574 Int)) )
))
(declare-datatypes ((ValueCell!9042 0))(
  ( (ValueCellFull!9042 (v!12084 V!30361)) (EmptyCell!9042) )
))
(declare-datatypes ((array!54094 0))(
  ( (array!54095 (arr!26002 (Array (_ BitVec 32) ValueCell!9042)) (size!26461 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54094)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!54096 0))(
  ( (array!54097 (arr!26003 (Array (_ BitVec 32) (_ BitVec 64))) (size!26462 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54096)

(assert (=> b!911746 (= res!615101 (and (= (size!26461 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26462 _keys!1386) (size!26461 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30295 () Bool)

(declare-fun tp!58161 () Bool)

(declare-fun e!511373 () Bool)

(assert (=> mapNonEmpty!30295 (= mapRes!30295 (and tp!58161 e!511373))))

(declare-fun mapKey!30295 () (_ BitVec 32))

(declare-fun mapValue!30295 () ValueCell!9042)

(declare-fun mapRest!30295 () (Array (_ BitVec 32) ValueCell!9042))

(assert (=> mapNonEmpty!30295 (= (arr!26002 _values!1152) (store mapRest!30295 mapKey!30295 mapValue!30295))))

(declare-fun res!615099 () Bool)

(assert (=> start!78118 (=> (not res!615099) (not e!511376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78118 (= res!615099 (validMask!0 mask!1756))))

(assert (=> start!78118 e!511376))

(declare-fun e!511375 () Bool)

(declare-fun array_inv!20324 (array!54094) Bool)

(assert (=> start!78118 (and (array_inv!20324 _values!1152) e!511375)))

(assert (=> start!78118 tp!58160))

(assert (=> start!78118 true))

(declare-fun tp_is_empty!19047 () Bool)

(assert (=> start!78118 tp_is_empty!19047))

(declare-fun array_inv!20325 (array!54096) Bool)

(assert (=> start!78118 (array_inv!20325 _keys!1386)))

(declare-fun b!911747 () Bool)

(assert (=> b!911747 (= e!511373 tp_is_empty!19047)))

(declare-fun b!911748 () Bool)

(declare-fun e!511377 () Bool)

(assert (=> b!911748 (= e!511377 tp_is_empty!19047)))

(declare-fun b!911749 () Bool)

(assert (=> b!911749 (= e!511375 (and e!511377 mapRes!30295))))

(declare-fun condMapEmpty!30295 () Bool)

(declare-fun mapDefault!30295 () ValueCell!9042)

(assert (=> b!911749 (= condMapEmpty!30295 (= (arr!26002 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9042)) mapDefault!30295)))))

(declare-fun b!911750 () Bool)

(declare-fun res!615100 () Bool)

(assert (=> b!911750 (=> (not res!615100) (not e!511376))))

(declare-datatypes ((List!18264 0))(
  ( (Nil!18261) (Cons!18260 (h!19406 (_ BitVec 64)) (t!25851 List!18264)) )
))
(declare-fun arrayNoDuplicates!0 (array!54096 (_ BitVec 32) List!18264) Bool)

(assert (=> b!911750 (= res!615100 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18261))))

(declare-fun b!911751 () Bool)

(assert (=> b!911751 (= e!511376 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30361)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!410504 () Bool)

(declare-fun minValue!1094 () V!30361)

(declare-datatypes ((tuple2!12472 0))(
  ( (tuple2!12473 (_1!6247 (_ BitVec 64)) (_2!6247 V!30361)) )
))
(declare-datatypes ((List!18265 0))(
  ( (Nil!18262) (Cons!18261 (h!19407 tuple2!12472) (t!25852 List!18265)) )
))
(declare-datatypes ((ListLongMap!11169 0))(
  ( (ListLongMap!11170 (toList!5600 List!18265)) )
))
(declare-fun contains!4645 (ListLongMap!11169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2862 (array!54096 array!54094 (_ BitVec 32) (_ BitVec 32) V!30361 V!30361 (_ BitVec 32) Int) ListLongMap!11169)

(assert (=> b!911751 (= lt!410504 (contains!4645 (getCurrentListMap!2862 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!911752 () Bool)

(declare-fun res!615102 () Bool)

(assert (=> b!911752 (=> (not res!615102) (not e!511376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54096 (_ BitVec 32)) Bool)

(assert (=> b!911752 (= res!615102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78118 res!615099) b!911746))

(assert (= (and b!911746 res!615101) b!911752))

(assert (= (and b!911752 res!615102) b!911750))

(assert (= (and b!911750 res!615100) b!911751))

(assert (= (and b!911749 condMapEmpty!30295) mapIsEmpty!30295))

(assert (= (and b!911749 (not condMapEmpty!30295)) mapNonEmpty!30295))

(get-info :version)

(assert (= (and mapNonEmpty!30295 ((_ is ValueCellFull!9042) mapValue!30295)) b!911747))

(assert (= (and b!911749 ((_ is ValueCellFull!9042) mapDefault!30295)) b!911748))

(assert (= start!78118 b!911749))

(declare-fun m!846423 () Bool)

(assert (=> b!911752 m!846423))

(declare-fun m!846425 () Bool)

(assert (=> b!911751 m!846425))

(assert (=> b!911751 m!846425))

(declare-fun m!846427 () Bool)

(assert (=> b!911751 m!846427))

(declare-fun m!846429 () Bool)

(assert (=> start!78118 m!846429))

(declare-fun m!846431 () Bool)

(assert (=> start!78118 m!846431))

(declare-fun m!846433 () Bool)

(assert (=> start!78118 m!846433))

(declare-fun m!846435 () Bool)

(assert (=> mapNonEmpty!30295 m!846435))

(declare-fun m!846437 () Bool)

(assert (=> b!911750 m!846437))

(check-sat (not b!911752) (not start!78118) b_and!27203 (not mapNonEmpty!30295) (not b!911750) (not b!911751) tp_is_empty!19047 (not b_next!16629))
(check-sat b_and!27203 (not b_next!16629))
