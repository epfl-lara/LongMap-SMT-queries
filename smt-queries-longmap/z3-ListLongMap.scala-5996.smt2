; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77996 () Bool)

(assert start!77996)

(declare-fun b_free!16387 () Bool)

(declare-fun b_next!16387 () Bool)

(assert (=> start!77996 (= b_free!16387 (not b_next!16387))))

(declare-fun tp!57426 () Bool)

(declare-fun b_and!26941 () Bool)

(assert (=> start!77996 (= tp!57426 b_and!26941)))

(declare-fun b!909499 () Bool)

(declare-fun e!509823 () Bool)

(declare-fun e!509826 () Bool)

(declare-fun mapRes!29923 () Bool)

(assert (=> b!909499 (= e!509823 (and e!509826 mapRes!29923))))

(declare-fun condMapEmpty!29923 () Bool)

(declare-datatypes ((V!30039 0))(
  ( (V!30040 (val!9453 Int)) )
))
(declare-datatypes ((ValueCell!8921 0))(
  ( (ValueCellFull!8921 (v!11957 V!30039)) (EmptyCell!8921) )
))
(declare-datatypes ((array!53687 0))(
  ( (array!53688 (arr!25797 (Array (_ BitVec 32) ValueCell!8921)) (size!26257 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53687)

(declare-fun mapDefault!29923 () ValueCell!8921)

(assert (=> b!909499 (= condMapEmpty!29923 (= (arr!25797 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8921)) mapDefault!29923)))))

(declare-fun b!909500 () Bool)

(declare-fun res!613600 () Bool)

(declare-fun e!509825 () Bool)

(assert (=> b!909500 (=> (not res!613600) (not e!509825))))

(declare-datatypes ((array!53689 0))(
  ( (array!53690 (arr!25798 (Array (_ BitVec 32) (_ BitVec 64))) (size!26258 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53689)

(declare-datatypes ((List!18087 0))(
  ( (Nil!18084) (Cons!18083 (h!19235 (_ BitVec 64)) (t!25638 List!18087)) )
))
(declare-fun arrayNoDuplicates!0 (array!53689 (_ BitVec 32) List!18087) Bool)

(assert (=> b!909500 (= res!613600 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18084))))

(declare-fun b!909501 () Bool)

(declare-fun res!613607 () Bool)

(assert (=> b!909501 (=> (not res!613607) (not e!509825))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!909501 (= res!613607 (and (= (size!26257 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26258 _keys!1386) (size!26257 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909502 () Bool)

(declare-fun e!509822 () Bool)

(declare-fun e!509824 () Bool)

(assert (=> b!909502 (= e!509822 (not e!509824))))

(declare-fun res!613604 () Bool)

(assert (=> b!909502 (=> res!613604 e!509824)))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!909502 (= res!613604 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26258 _keys!1386))))))

(declare-fun lt!410136 () V!30039)

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13592 (ValueCell!8921 V!30039) V!30039)

(declare-fun dynLambda!1395 (Int (_ BitVec 64)) V!30039)

(assert (=> b!909502 (= lt!410136 (get!13592 (select (arr!25797 _values!1152) i!717) (dynLambda!1395 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!909502 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30039)

(declare-datatypes ((Unit!30832 0))(
  ( (Unit!30833) )
))
(declare-fun lt!410135 () Unit!30832)

(declare-fun minValue!1094 () V!30039)

(declare-fun lemmaKeyInListMapIsInArray!254 (array!53689 array!53687 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 64) Int) Unit!30832)

(assert (=> b!909502 (= lt!410135 (lemmaKeyInListMapIsInArray!254 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!909503 () Bool)

(declare-fun res!613606 () Bool)

(assert (=> b!909503 (=> (not res!613606) (not e!509825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53689 (_ BitVec 32)) Bool)

(assert (=> b!909503 (= res!613606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909504 () Bool)

(declare-fun e!509829 () Bool)

(assert (=> b!909504 (= e!509829 true)))

(declare-datatypes ((tuple2!12262 0))(
  ( (tuple2!12263 (_1!6142 (_ BitVec 64)) (_2!6142 V!30039)) )
))
(declare-datatypes ((List!18088 0))(
  ( (Nil!18085) (Cons!18084 (h!19236 tuple2!12262) (t!25639 List!18088)) )
))
(declare-datatypes ((ListLongMap!10961 0))(
  ( (ListLongMap!10962 (toList!5496 List!18088)) )
))
(declare-fun lt!410134 () ListLongMap!10961)

(declare-fun apply!512 (ListLongMap!10961 (_ BitVec 64)) V!30039)

(assert (=> b!909504 (= (apply!512 lt!410134 k0!1033) lt!410136)))

(declare-fun lt!410132 () Unit!30832)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!57 (array!53689 array!53687 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 64) V!30039 (_ BitVec 32) Int) Unit!30832)

(assert (=> b!909504 (= lt!410132 (lemmaListMapApplyFromThenApplyFromZero!57 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!410136 i!717 defaultEntry!1160))))

(declare-fun b!909505 () Bool)

(assert (=> b!909505 (= e!509824 e!509829)))

(declare-fun res!613605 () Bool)

(assert (=> b!909505 (=> res!613605 e!509829)))

(declare-fun lt!410133 () ListLongMap!10961)

(declare-fun contains!4547 (ListLongMap!10961 (_ BitVec 64)) Bool)

(assert (=> b!909505 (= res!613605 (not (contains!4547 lt!410133 k0!1033)))))

(declare-fun getCurrentListMap!2757 (array!53689 array!53687 (_ BitVec 32) (_ BitVec 32) V!30039 V!30039 (_ BitVec 32) Int) ListLongMap!10961)

(assert (=> b!909505 (= lt!410133 (getCurrentListMap!2757 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!909506 () Bool)

(declare-fun e!509827 () Bool)

(declare-fun tp_is_empty!18805 () Bool)

(assert (=> b!909506 (= e!509827 tp_is_empty!18805)))

(declare-fun b!909507 () Bool)

(declare-fun res!613602 () Bool)

(assert (=> b!909507 (=> res!613602 e!509829)))

(assert (=> b!909507 (= res!613602 (not (= (apply!512 lt!410133 k0!1033) lt!410136)))))

(declare-fun mapNonEmpty!29923 () Bool)

(declare-fun tp!57427 () Bool)

(assert (=> mapNonEmpty!29923 (= mapRes!29923 (and tp!57427 e!509827))))

(declare-fun mapKey!29923 () (_ BitVec 32))

(declare-fun mapValue!29923 () ValueCell!8921)

(declare-fun mapRest!29923 () (Array (_ BitVec 32) ValueCell!8921))

(assert (=> mapNonEmpty!29923 (= (arr!25797 _values!1152) (store mapRest!29923 mapKey!29923 mapValue!29923))))

(declare-fun b!909508 () Bool)

(assert (=> b!909508 (= e!509825 e!509822)))

(declare-fun res!613599 () Bool)

(assert (=> b!909508 (=> (not res!613599) (not e!509822))))

(assert (=> b!909508 (= res!613599 (contains!4547 lt!410134 k0!1033))))

(assert (=> b!909508 (= lt!410134 (getCurrentListMap!2757 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!909509 () Bool)

(declare-fun res!613598 () Bool)

(assert (=> b!909509 (=> (not res!613598) (not e!509822))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!909509 (= res!613598 (inRange!0 i!717 mask!1756))))

(declare-fun b!909510 () Bool)

(declare-fun res!613601 () Bool)

(assert (=> b!909510 (=> (not res!613601) (not e!509822))))

(assert (=> b!909510 (= res!613601 (and (= (select (arr!25798 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!613603 () Bool)

(assert (=> start!77996 (=> (not res!613603) (not e!509825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77996 (= res!613603 (validMask!0 mask!1756))))

(assert (=> start!77996 e!509825))

(declare-fun array_inv!20256 (array!53687) Bool)

(assert (=> start!77996 (and (array_inv!20256 _values!1152) e!509823)))

(assert (=> start!77996 tp!57426))

(assert (=> start!77996 true))

(assert (=> start!77996 tp_is_empty!18805))

(declare-fun array_inv!20257 (array!53689) Bool)

(assert (=> start!77996 (array_inv!20257 _keys!1386)))

(declare-fun b!909511 () Bool)

(assert (=> b!909511 (= e!509826 tp_is_empty!18805)))

(declare-fun mapIsEmpty!29923 () Bool)

(assert (=> mapIsEmpty!29923 mapRes!29923))

(assert (= (and start!77996 res!613603) b!909501))

(assert (= (and b!909501 res!613607) b!909503))

(assert (= (and b!909503 res!613606) b!909500))

(assert (= (and b!909500 res!613600) b!909508))

(assert (= (and b!909508 res!613599) b!909509))

(assert (= (and b!909509 res!613598) b!909510))

(assert (= (and b!909510 res!613601) b!909502))

(assert (= (and b!909502 (not res!613604)) b!909505))

(assert (= (and b!909505 (not res!613605)) b!909507))

(assert (= (and b!909507 (not res!613602)) b!909504))

(assert (= (and b!909499 condMapEmpty!29923) mapIsEmpty!29923))

(assert (= (and b!909499 (not condMapEmpty!29923)) mapNonEmpty!29923))

(get-info :version)

(assert (= (and mapNonEmpty!29923 ((_ is ValueCellFull!8921) mapValue!29923)) b!909506))

(assert (= (and b!909499 ((_ is ValueCellFull!8921) mapDefault!29923)) b!909511))

(assert (= start!77996 b!909499))

(declare-fun b_lambda!13285 () Bool)

(assert (=> (not b_lambda!13285) (not b!909502)))

(declare-fun t!25637 () Bool)

(declare-fun tb!5401 () Bool)

(assert (=> (and start!77996 (= defaultEntry!1160 defaultEntry!1160) t!25637) tb!5401))

(declare-fun result!10607 () Bool)

(assert (=> tb!5401 (= result!10607 tp_is_empty!18805)))

(assert (=> b!909502 t!25637))

(declare-fun b_and!26943 () Bool)

(assert (= b_and!26941 (and (=> t!25637 result!10607) b_and!26943)))

(declare-fun m!845223 () Bool)

(assert (=> start!77996 m!845223))

(declare-fun m!845225 () Bool)

(assert (=> start!77996 m!845225))

(declare-fun m!845227 () Bool)

(assert (=> start!77996 m!845227))

(declare-fun m!845229 () Bool)

(assert (=> b!909502 m!845229))

(declare-fun m!845231 () Bool)

(assert (=> b!909502 m!845231))

(declare-fun m!845233 () Bool)

(assert (=> b!909502 m!845233))

(declare-fun m!845235 () Bool)

(assert (=> b!909502 m!845235))

(assert (=> b!909502 m!845229))

(assert (=> b!909502 m!845233))

(declare-fun m!845237 () Bool)

(assert (=> b!909502 m!845237))

(declare-fun m!845239 () Bool)

(assert (=> b!909500 m!845239))

(declare-fun m!845241 () Bool)

(assert (=> b!909504 m!845241))

(declare-fun m!845243 () Bool)

(assert (=> b!909504 m!845243))

(declare-fun m!845245 () Bool)

(assert (=> b!909508 m!845245))

(declare-fun m!845247 () Bool)

(assert (=> b!909508 m!845247))

(declare-fun m!845249 () Bool)

(assert (=> b!909510 m!845249))

(declare-fun m!845251 () Bool)

(assert (=> b!909503 m!845251))

(declare-fun m!845253 () Bool)

(assert (=> b!909509 m!845253))

(declare-fun m!845255 () Bool)

(assert (=> b!909505 m!845255))

(declare-fun m!845257 () Bool)

(assert (=> b!909505 m!845257))

(declare-fun m!845259 () Bool)

(assert (=> mapNonEmpty!29923 m!845259))

(declare-fun m!845261 () Bool)

(assert (=> b!909507 m!845261))

(check-sat tp_is_empty!18805 (not b!909500) (not start!77996) (not b!909508) (not b!909503) (not b!909507) (not b!909505) (not b!909502) (not b_lambda!13285) (not b_next!16387) (not mapNonEmpty!29923) (not b!909504) (not b!909509) b_and!26943)
(check-sat b_and!26943 (not b_next!16387))
