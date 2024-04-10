; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81844 () Bool)

(assert start!81844)

(declare-fun b_free!18339 () Bool)

(declare-fun b_next!18339 () Bool)

(assert (=> start!81844 (= b_free!18339 (not b_next!18339))))

(declare-fun tp!63717 () Bool)

(declare-fun b_and!29825 () Bool)

(assert (=> start!81844 (= tp!63717 b_and!29825)))

(declare-fun b!954454 () Bool)

(declare-fun res!639145 () Bool)

(declare-fun e!537733 () Bool)

(assert (=> b!954454 (=> (not res!639145) (not e!537733))))

(declare-datatypes ((array!57879 0))(
  ( (array!57880 (arr!27819 (Array (_ BitVec 32) (_ BitVec 64))) (size!28298 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57879)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57879 (_ BitVec 32)) Bool)

(assert (=> b!954454 (= res!639145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33286 () Bool)

(declare-fun mapRes!33286 () Bool)

(assert (=> mapIsEmpty!33286 mapRes!33286))

(declare-fun b!954455 () Bool)

(declare-fun res!639149 () Bool)

(assert (=> b!954455 (=> (not res!639149) (not e!537733))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32827 0))(
  ( (V!32828 (val!10492 Int)) )
))
(declare-datatypes ((ValueCell!9960 0))(
  ( (ValueCellFull!9960 (v!13047 V!32827)) (EmptyCell!9960) )
))
(declare-datatypes ((array!57881 0))(
  ( (array!57882 (arr!27820 (Array (_ BitVec 32) ValueCell!9960)) (size!28299 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57881)

(assert (=> b!954455 (= res!639149 (and (= (size!28299 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28298 _keys!1441) (size!28299 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954456 () Bool)

(declare-fun e!537730 () Bool)

(declare-fun e!537729 () Bool)

(assert (=> b!954456 (= e!537730 (and e!537729 mapRes!33286))))

(declare-fun condMapEmpty!33286 () Bool)

(declare-fun mapDefault!33286 () ValueCell!9960)

(assert (=> b!954456 (= condMapEmpty!33286 (= (arr!27820 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9960)) mapDefault!33286)))))

(declare-fun mapNonEmpty!33286 () Bool)

(declare-fun tp!63716 () Bool)

(declare-fun e!537731 () Bool)

(assert (=> mapNonEmpty!33286 (= mapRes!33286 (and tp!63716 e!537731))))

(declare-fun mapValue!33286 () ValueCell!9960)

(declare-fun mapKey!33286 () (_ BitVec 32))

(declare-fun mapRest!33286 () (Array (_ BitVec 32) ValueCell!9960))

(assert (=> mapNonEmpty!33286 (= (arr!27820 _values!1197) (store mapRest!33286 mapKey!33286 mapValue!33286))))

(declare-fun b!954457 () Bool)

(declare-fun tp_is_empty!20883 () Bool)

(assert (=> b!954457 (= e!537731 tp_is_empty!20883)))

(declare-fun b!954458 () Bool)

(declare-fun res!639148 () Bool)

(assert (=> b!954458 (=> (not res!639148) (not e!537733))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954458 (= res!639148 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28298 _keys!1441))))))

(declare-fun b!954459 () Bool)

(assert (=> b!954459 (= e!537733 false)))

(declare-fun zeroValue!1139 () V!32827)

(declare-fun lt!429902 () Bool)

(declare-fun minValue!1139 () V!32827)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13616 0))(
  ( (tuple2!13617 (_1!6819 (_ BitVec 64)) (_2!6819 V!32827)) )
))
(declare-datatypes ((List!19396 0))(
  ( (Nil!19393) (Cons!19392 (h!20554 tuple2!13616) (t!27757 List!19396)) )
))
(declare-datatypes ((ListLongMap!12313 0))(
  ( (ListLongMap!12314 (toList!6172 List!19396)) )
))
(declare-fun contains!5270 (ListLongMap!12313 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3405 (array!57879 array!57881 (_ BitVec 32) (_ BitVec 32) V!32827 V!32827 (_ BitVec 32) Int) ListLongMap!12313)

(assert (=> b!954459 (= lt!429902 (contains!5270 (getCurrentListMap!3405 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27819 _keys!1441) i!735)))))

(declare-fun res!639146 () Bool)

(assert (=> start!81844 (=> (not res!639146) (not e!537733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81844 (= res!639146 (validMask!0 mask!1823))))

(assert (=> start!81844 e!537733))

(assert (=> start!81844 true))

(assert (=> start!81844 tp_is_empty!20883))

(declare-fun array_inv!21599 (array!57879) Bool)

(assert (=> start!81844 (array_inv!21599 _keys!1441)))

(declare-fun array_inv!21600 (array!57881) Bool)

(assert (=> start!81844 (and (array_inv!21600 _values!1197) e!537730)))

(assert (=> start!81844 tp!63717))

(declare-fun b!954460 () Bool)

(assert (=> b!954460 (= e!537729 tp_is_empty!20883)))

(declare-fun b!954461 () Bool)

(declare-fun res!639150 () Bool)

(assert (=> b!954461 (=> (not res!639150) (not e!537733))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954461 (= res!639150 (validKeyInArray!0 (select (arr!27819 _keys!1441) i!735)))))

(declare-fun b!954462 () Bool)

(declare-fun res!639147 () Bool)

(assert (=> b!954462 (=> (not res!639147) (not e!537733))))

(declare-datatypes ((List!19397 0))(
  ( (Nil!19394) (Cons!19393 (h!20555 (_ BitVec 64)) (t!27758 List!19397)) )
))
(declare-fun arrayNoDuplicates!0 (array!57879 (_ BitVec 32) List!19397) Bool)

(assert (=> b!954462 (= res!639147 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19394))))

(assert (= (and start!81844 res!639146) b!954455))

(assert (= (and b!954455 res!639149) b!954454))

(assert (= (and b!954454 res!639145) b!954462))

(assert (= (and b!954462 res!639147) b!954458))

(assert (= (and b!954458 res!639148) b!954461))

(assert (= (and b!954461 res!639150) b!954459))

(assert (= (and b!954456 condMapEmpty!33286) mapIsEmpty!33286))

(assert (= (and b!954456 (not condMapEmpty!33286)) mapNonEmpty!33286))

(get-info :version)

(assert (= (and mapNonEmpty!33286 ((_ is ValueCellFull!9960) mapValue!33286)) b!954457))

(assert (= (and b!954456 ((_ is ValueCellFull!9960) mapDefault!33286)) b!954460))

(assert (= start!81844 b!954456))

(declare-fun m!886183 () Bool)

(assert (=> b!954462 m!886183))

(declare-fun m!886185 () Bool)

(assert (=> mapNonEmpty!33286 m!886185))

(declare-fun m!886187 () Bool)

(assert (=> b!954459 m!886187))

(declare-fun m!886189 () Bool)

(assert (=> b!954459 m!886189))

(assert (=> b!954459 m!886187))

(assert (=> b!954459 m!886189))

(declare-fun m!886191 () Bool)

(assert (=> b!954459 m!886191))

(declare-fun m!886193 () Bool)

(assert (=> b!954454 m!886193))

(declare-fun m!886195 () Bool)

(assert (=> start!81844 m!886195))

(declare-fun m!886197 () Bool)

(assert (=> start!81844 m!886197))

(declare-fun m!886199 () Bool)

(assert (=> start!81844 m!886199))

(assert (=> b!954461 m!886189))

(assert (=> b!954461 m!886189))

(declare-fun m!886201 () Bool)

(assert (=> b!954461 m!886201))

(check-sat b_and!29825 (not b_next!18339) (not mapNonEmpty!33286) (not start!81844) (not b!954454) (not b!954462) (not b!954459) tp_is_empty!20883 (not b!954461))
(check-sat b_and!29825 (not b_next!18339))
