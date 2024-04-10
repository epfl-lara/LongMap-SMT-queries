; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77558 () Bool)

(assert start!77558)

(declare-fun b_free!16143 () Bool)

(declare-fun b_next!16143 () Bool)

(assert (=> start!77558 (= b_free!16143 (not b_next!16143))))

(declare-fun tp!56691 () Bool)

(declare-fun b_and!26509 () Bool)

(assert (=> start!77558 (= tp!56691 b_and!26509)))

(declare-fun b!903635 () Bool)

(declare-fun res!609656 () Bool)

(declare-fun e!506322 () Bool)

(assert (=> b!903635 (=> (not res!609656) (not e!506322))))

(declare-datatypes ((array!53174 0))(
  ( (array!53175 (arr!25546 (Array (_ BitVec 32) (_ BitVec 64))) (size!26005 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53174)

(declare-datatypes ((List!17935 0))(
  ( (Nil!17932) (Cons!17931 (h!19077 (_ BitVec 64)) (t!25318 List!17935)) )
))
(declare-fun arrayNoDuplicates!0 (array!53174 (_ BitVec 32) List!17935) Bool)

(assert (=> b!903635 (= res!609656 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17932))))

(declare-fun b!903636 () Bool)

(declare-fun e!506325 () Bool)

(declare-fun tp_is_empty!18561 () Bool)

(assert (=> b!903636 (= e!506325 tp_is_empty!18561)))

(declare-fun b!903637 () Bool)

(declare-fun res!609655 () Bool)

(assert (=> b!903637 (=> (not res!609655) (not e!506322))))

(declare-datatypes ((V!29713 0))(
  ( (V!29714 (val!9331 Int)) )
))
(declare-datatypes ((ValueCell!8799 0))(
  ( (ValueCellFull!8799 (v!11836 V!29713)) (EmptyCell!8799) )
))
(declare-datatypes ((array!53176 0))(
  ( (array!53177 (arr!25547 (Array (_ BitVec 32) ValueCell!8799)) (size!26006 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53176)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903637 (= res!609655 (and (= (size!26006 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26005 _keys!1386) (size!26006 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903638 () Bool)

(declare-fun e!506321 () Bool)

(declare-fun mapRes!29554 () Bool)

(assert (=> b!903638 (= e!506321 (and e!506325 mapRes!29554))))

(declare-fun condMapEmpty!29554 () Bool)

(declare-fun mapDefault!29554 () ValueCell!8799)

(assert (=> b!903638 (= condMapEmpty!29554 (= (arr!25547 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8799)) mapDefault!29554)))))

(declare-fun b!903639 () Bool)

(declare-fun res!609654 () Bool)

(assert (=> b!903639 (=> (not res!609654) (not e!506322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53174 (_ BitVec 32)) Bool)

(assert (=> b!903639 (= res!609654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!609653 () Bool)

(assert (=> start!77558 (=> (not res!609653) (not e!506322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77558 (= res!609653 (validMask!0 mask!1756))))

(assert (=> start!77558 e!506322))

(declare-fun array_inv!20016 (array!53176) Bool)

(assert (=> start!77558 (and (array_inv!20016 _values!1152) e!506321)))

(assert (=> start!77558 tp!56691))

(assert (=> start!77558 true))

(assert (=> start!77558 tp_is_empty!18561))

(declare-fun array_inv!20017 (array!53174) Bool)

(assert (=> start!77558 (array_inv!20017 _keys!1386)))

(declare-fun mapIsEmpty!29554 () Bool)

(assert (=> mapIsEmpty!29554 mapRes!29554))

(declare-fun mapNonEmpty!29554 () Bool)

(declare-fun tp!56690 () Bool)

(declare-fun e!506324 () Bool)

(assert (=> mapNonEmpty!29554 (= mapRes!29554 (and tp!56690 e!506324))))

(declare-fun mapKey!29554 () (_ BitVec 32))

(declare-fun mapValue!29554 () ValueCell!8799)

(declare-fun mapRest!29554 () (Array (_ BitVec 32) ValueCell!8799))

(assert (=> mapNonEmpty!29554 (= (arr!25547 _values!1152) (store mapRest!29554 mapKey!29554 mapValue!29554))))

(declare-fun b!903640 () Bool)

(assert (=> b!903640 (= e!506324 tp_is_empty!18561)))

(declare-fun b!903641 () Bool)

(assert (=> b!903641 (= e!506322 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29713)

(declare-fun lt!408036 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!29713)

(declare-datatypes ((tuple2!12116 0))(
  ( (tuple2!12117 (_1!6069 (_ BitVec 64)) (_2!6069 V!29713)) )
))
(declare-datatypes ((List!17936 0))(
  ( (Nil!17933) (Cons!17932 (h!19078 tuple2!12116) (t!25319 List!17936)) )
))
(declare-datatypes ((ListLongMap!10813 0))(
  ( (ListLongMap!10814 (toList!5422 List!17936)) )
))
(declare-fun contains!4470 (ListLongMap!10813 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2691 (array!53174 array!53176 (_ BitVec 32) (_ BitVec 32) V!29713 V!29713 (_ BitVec 32) Int) ListLongMap!10813)

(assert (=> b!903641 (= lt!408036 (contains!4470 (getCurrentListMap!2691 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!77558 res!609653) b!903637))

(assert (= (and b!903637 res!609655) b!903639))

(assert (= (and b!903639 res!609654) b!903635))

(assert (= (and b!903635 res!609656) b!903641))

(assert (= (and b!903638 condMapEmpty!29554) mapIsEmpty!29554))

(assert (= (and b!903638 (not condMapEmpty!29554)) mapNonEmpty!29554))

(get-info :version)

(assert (= (and mapNonEmpty!29554 ((_ is ValueCellFull!8799) mapValue!29554)) b!903640))

(assert (= (and b!903638 ((_ is ValueCellFull!8799) mapDefault!29554)) b!903636))

(assert (= start!77558 b!903638))

(declare-fun m!839273 () Bool)

(assert (=> start!77558 m!839273))

(declare-fun m!839275 () Bool)

(assert (=> start!77558 m!839275))

(declare-fun m!839277 () Bool)

(assert (=> start!77558 m!839277))

(declare-fun m!839279 () Bool)

(assert (=> mapNonEmpty!29554 m!839279))

(declare-fun m!839281 () Bool)

(assert (=> b!903635 m!839281))

(declare-fun m!839283 () Bool)

(assert (=> b!903641 m!839283))

(assert (=> b!903641 m!839283))

(declare-fun m!839285 () Bool)

(assert (=> b!903641 m!839285))

(declare-fun m!839287 () Bool)

(assert (=> b!903639 m!839287))

(check-sat (not mapNonEmpty!29554) tp_is_empty!18561 (not start!77558) (not b_next!16143) (not b!903639) (not b!903635) (not b!903641) b_and!26509)
(check-sat b_and!26509 (not b_next!16143))
