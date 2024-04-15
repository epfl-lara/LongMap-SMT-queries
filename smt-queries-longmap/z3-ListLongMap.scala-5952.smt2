; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77520 () Bool)

(assert start!77520)

(declare-fun b_free!16123 () Bool)

(declare-fun b_next!16123 () Bool)

(assert (=> start!77520 (= b_free!16123 (not b_next!16123))))

(declare-fun tp!56632 () Bool)

(declare-fun b_and!26463 () Bool)

(assert (=> start!77520 (= tp!56632 b_and!26463)))

(declare-fun b!903186 () Bool)

(declare-fun e!506025 () Bool)

(assert (=> b!903186 (= e!506025 false)))

(declare-datatypes ((V!29687 0))(
  ( (V!29688 (val!9321 Int)) )
))
(declare-datatypes ((ValueCell!8789 0))(
  ( (ValueCellFull!8789 (v!11825 V!29687)) (EmptyCell!8789) )
))
(declare-datatypes ((array!53121 0))(
  ( (array!53122 (arr!25520 (Array (_ BitVec 32) ValueCell!8789)) (size!25981 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53121)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29687)

(declare-fun lt!407770 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29687)

(declare-datatypes ((array!53123 0))(
  ( (array!53124 (arr!25521 (Array (_ BitVec 32) (_ BitVec 64))) (size!25982 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53123)

(declare-datatypes ((tuple2!12130 0))(
  ( (tuple2!12131 (_1!6076 (_ BitVec 64)) (_2!6076 V!29687)) )
))
(declare-datatypes ((List!17935 0))(
  ( (Nil!17932) (Cons!17931 (h!19077 tuple2!12130) (t!25309 List!17935)) )
))
(declare-datatypes ((ListLongMap!10817 0))(
  ( (ListLongMap!10818 (toList!5424 List!17935)) )
))
(declare-fun contains!4435 (ListLongMap!10817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2639 (array!53123 array!53121 (_ BitVec 32) (_ BitVec 32) V!29687 V!29687 (_ BitVec 32) Int) ListLongMap!10817)

(assert (=> b!903186 (= lt!407770 (contains!4435 (getCurrentListMap!2639 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903187 () Bool)

(declare-fun res!609424 () Bool)

(assert (=> b!903187 (=> (not res!609424) (not e!506025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53123 (_ BitVec 32)) Bool)

(assert (=> b!903187 (= res!609424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903188 () Bool)

(declare-fun res!609425 () Bool)

(assert (=> b!903188 (=> (not res!609425) (not e!506025))))

(assert (=> b!903188 (= res!609425 (and (= (size!25981 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25982 _keys!1386) (size!25981 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903189 () Bool)

(declare-fun e!506023 () Bool)

(declare-fun tp_is_empty!18541 () Bool)

(assert (=> b!903189 (= e!506023 tp_is_empty!18541)))

(declare-fun b!903190 () Bool)

(declare-fun e!506026 () Bool)

(declare-fun e!506027 () Bool)

(declare-fun mapRes!29524 () Bool)

(assert (=> b!903190 (= e!506026 (and e!506027 mapRes!29524))))

(declare-fun condMapEmpty!29524 () Bool)

(declare-fun mapDefault!29524 () ValueCell!8789)

(assert (=> b!903190 (= condMapEmpty!29524 (= (arr!25520 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8789)) mapDefault!29524)))))

(declare-fun b!903191 () Bool)

(assert (=> b!903191 (= e!506027 tp_is_empty!18541)))

(declare-fun mapIsEmpty!29524 () Bool)

(assert (=> mapIsEmpty!29524 mapRes!29524))

(declare-fun b!903192 () Bool)

(declare-fun res!609423 () Bool)

(assert (=> b!903192 (=> (not res!609423) (not e!506025))))

(declare-datatypes ((List!17936 0))(
  ( (Nil!17933) (Cons!17932 (h!19078 (_ BitVec 64)) (t!25310 List!17936)) )
))
(declare-fun arrayNoDuplicates!0 (array!53123 (_ BitVec 32) List!17936) Bool)

(assert (=> b!903192 (= res!609423 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17933))))

(declare-fun res!609426 () Bool)

(assert (=> start!77520 (=> (not res!609426) (not e!506025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77520 (= res!609426 (validMask!0 mask!1756))))

(assert (=> start!77520 e!506025))

(declare-fun array_inv!20056 (array!53121) Bool)

(assert (=> start!77520 (and (array_inv!20056 _values!1152) e!506026)))

(assert (=> start!77520 tp!56632))

(assert (=> start!77520 true))

(assert (=> start!77520 tp_is_empty!18541))

(declare-fun array_inv!20057 (array!53123) Bool)

(assert (=> start!77520 (array_inv!20057 _keys!1386)))

(declare-fun mapNonEmpty!29524 () Bool)

(declare-fun tp!56631 () Bool)

(assert (=> mapNonEmpty!29524 (= mapRes!29524 (and tp!56631 e!506023))))

(declare-fun mapRest!29524 () (Array (_ BitVec 32) ValueCell!8789))

(declare-fun mapKey!29524 () (_ BitVec 32))

(declare-fun mapValue!29524 () ValueCell!8789)

(assert (=> mapNonEmpty!29524 (= (arr!25520 _values!1152) (store mapRest!29524 mapKey!29524 mapValue!29524))))

(assert (= (and start!77520 res!609426) b!903188))

(assert (= (and b!903188 res!609425) b!903187))

(assert (= (and b!903187 res!609424) b!903192))

(assert (= (and b!903192 res!609423) b!903186))

(assert (= (and b!903190 condMapEmpty!29524) mapIsEmpty!29524))

(assert (= (and b!903190 (not condMapEmpty!29524)) mapNonEmpty!29524))

(get-info :version)

(assert (= (and mapNonEmpty!29524 ((_ is ValueCellFull!8789) mapValue!29524)) b!903189))

(assert (= (and b!903190 ((_ is ValueCellFull!8789) mapDefault!29524)) b!903191))

(assert (= start!77520 b!903190))

(declare-fun m!838355 () Bool)

(assert (=> b!903192 m!838355))

(declare-fun m!838357 () Bool)

(assert (=> b!903186 m!838357))

(assert (=> b!903186 m!838357))

(declare-fun m!838359 () Bool)

(assert (=> b!903186 m!838359))

(declare-fun m!838361 () Bool)

(assert (=> start!77520 m!838361))

(declare-fun m!838363 () Bool)

(assert (=> start!77520 m!838363))

(declare-fun m!838365 () Bool)

(assert (=> start!77520 m!838365))

(declare-fun m!838367 () Bool)

(assert (=> b!903187 m!838367))

(declare-fun m!838369 () Bool)

(assert (=> mapNonEmpty!29524 m!838369))

(check-sat (not b!903192) (not b!903187) (not mapNonEmpty!29524) (not b_next!16123) b_and!26463 tp_is_empty!18541 (not start!77520) (not b!903186))
(check-sat b_and!26463 (not b_next!16123))
