; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77688 () Bool)

(assert start!77688)

(declare-fun b_free!16105 () Bool)

(declare-fun b_next!16105 () Bool)

(assert (=> start!77688 (= b_free!16105 (not b_next!16105))))

(declare-fun tp!56577 () Bool)

(declare-fun b_and!26481 () Bool)

(assert (=> start!77688 (= tp!56577 b_and!26481)))

(declare-fun b!904139 () Bool)

(declare-fun res!609771 () Bool)

(declare-fun e!506618 () Bool)

(assert (=> b!904139 (=> (not res!609771) (not e!506618))))

(declare-datatypes ((V!29663 0))(
  ( (V!29664 (val!9312 Int)) )
))
(declare-datatypes ((ValueCell!8780 0))(
  ( (ValueCellFull!8780 (v!11814 V!29663)) (EmptyCell!8780) )
))
(declare-datatypes ((array!53141 0))(
  ( (array!53142 (arr!25525 (Array (_ BitVec 32) ValueCell!8780)) (size!25985 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53141)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53143 0))(
  ( (array!53144 (arr!25526 (Array (_ BitVec 32) (_ BitVec 64))) (size!25986 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53143)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!904139 (= res!609771 (and (= (size!25985 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25986 _keys!1386) (size!25985 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609772 () Bool)

(assert (=> start!77688 (=> (not res!609772) (not e!506618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77688 (= res!609772 (validMask!0 mask!1756))))

(assert (=> start!77688 e!506618))

(declare-fun e!506621 () Bool)

(declare-fun array_inv!20070 (array!53141) Bool)

(assert (=> start!77688 (and (array_inv!20070 _values!1152) e!506621)))

(assert (=> start!77688 tp!56577))

(assert (=> start!77688 true))

(declare-fun tp_is_empty!18523 () Bool)

(assert (=> start!77688 tp_is_empty!18523))

(declare-fun array_inv!20071 (array!53143) Bool)

(assert (=> start!77688 (array_inv!20071 _keys!1386)))

(declare-fun b!904140 () Bool)

(assert (=> b!904140 (= e!506618 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29663)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408340 () Bool)

(declare-fun minValue!1094 () V!29663)

(declare-datatypes ((tuple2!12020 0))(
  ( (tuple2!12021 (_1!6021 (_ BitVec 64)) (_2!6021 V!29663)) )
))
(declare-datatypes ((List!17871 0))(
  ( (Nil!17868) (Cons!17867 (h!19019 tuple2!12020) (t!25246 List!17871)) )
))
(declare-datatypes ((ListLongMap!10719 0))(
  ( (ListLongMap!10720 (toList!5375 List!17871)) )
))
(declare-fun contains!4433 (ListLongMap!10719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2644 (array!53143 array!53141 (_ BitVec 32) (_ BitVec 32) V!29663 V!29663 (_ BitVec 32) Int) ListLongMap!10719)

(assert (=> b!904140 (= lt!408340 (contains!4433 (getCurrentListMap!2644 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!904141 () Bool)

(declare-fun e!506619 () Bool)

(assert (=> b!904141 (= e!506619 tp_is_empty!18523)))

(declare-fun mapNonEmpty!29497 () Bool)

(declare-fun mapRes!29497 () Bool)

(declare-fun tp!56578 () Bool)

(assert (=> mapNonEmpty!29497 (= mapRes!29497 (and tp!56578 e!506619))))

(declare-fun mapRest!29497 () (Array (_ BitVec 32) ValueCell!8780))

(declare-fun mapKey!29497 () (_ BitVec 32))

(declare-fun mapValue!29497 () ValueCell!8780)

(assert (=> mapNonEmpty!29497 (= (arr!25525 _values!1152) (store mapRest!29497 mapKey!29497 mapValue!29497))))

(declare-fun mapIsEmpty!29497 () Bool)

(assert (=> mapIsEmpty!29497 mapRes!29497))

(declare-fun b!904142 () Bool)

(declare-fun e!506620 () Bool)

(assert (=> b!904142 (= e!506620 tp_is_empty!18523)))

(declare-fun b!904143 () Bool)

(assert (=> b!904143 (= e!506621 (and e!506620 mapRes!29497))))

(declare-fun condMapEmpty!29497 () Bool)

(declare-fun mapDefault!29497 () ValueCell!8780)

(assert (=> b!904143 (= condMapEmpty!29497 (= (arr!25525 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8780)) mapDefault!29497)))))

(declare-fun b!904144 () Bool)

(declare-fun res!609769 () Bool)

(assert (=> b!904144 (=> (not res!609769) (not e!506618))))

(declare-datatypes ((List!17872 0))(
  ( (Nil!17869) (Cons!17868 (h!19020 (_ BitVec 64)) (t!25247 List!17872)) )
))
(declare-fun arrayNoDuplicates!0 (array!53143 (_ BitVec 32) List!17872) Bool)

(assert (=> b!904144 (= res!609769 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17869))))

(declare-fun b!904145 () Bool)

(declare-fun res!609770 () Bool)

(assert (=> b!904145 (=> (not res!609770) (not e!506618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53143 (_ BitVec 32)) Bool)

(assert (=> b!904145 (= res!609770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!77688 res!609772) b!904139))

(assert (= (and b!904139 res!609771) b!904145))

(assert (= (and b!904145 res!609770) b!904144))

(assert (= (and b!904144 res!609769) b!904140))

(assert (= (and b!904143 condMapEmpty!29497) mapIsEmpty!29497))

(assert (= (and b!904143 (not condMapEmpty!29497)) mapNonEmpty!29497))

(get-info :version)

(assert (= (and mapNonEmpty!29497 ((_ is ValueCellFull!8780) mapValue!29497)) b!904141))

(assert (= (and b!904143 ((_ is ValueCellFull!8780) mapDefault!29497)) b!904142))

(assert (= start!77688 b!904143))

(declare-fun m!840263 () Bool)

(assert (=> b!904140 m!840263))

(assert (=> b!904140 m!840263))

(declare-fun m!840265 () Bool)

(assert (=> b!904140 m!840265))

(declare-fun m!840267 () Bool)

(assert (=> b!904145 m!840267))

(declare-fun m!840269 () Bool)

(assert (=> mapNonEmpty!29497 m!840269))

(declare-fun m!840271 () Bool)

(assert (=> b!904144 m!840271))

(declare-fun m!840273 () Bool)

(assert (=> start!77688 m!840273))

(declare-fun m!840275 () Bool)

(assert (=> start!77688 m!840275))

(declare-fun m!840277 () Bool)

(assert (=> start!77688 m!840277))

(check-sat (not b!904145) (not b_next!16105) (not b!904144) (not mapNonEmpty!29497) (not start!77688) b_and!26481 (not b!904140) tp_is_empty!18523)
(check-sat b_and!26481 (not b_next!16105))
