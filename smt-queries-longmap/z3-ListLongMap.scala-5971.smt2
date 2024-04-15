; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77634 () Bool)

(assert start!77634)

(declare-fun b_free!16237 () Bool)

(declare-fun b_next!16237 () Bool)

(assert (=> start!77634 (= b_free!16237 (not b_next!16237))))

(declare-fun tp!56974 () Bool)

(declare-fun b_and!26601 () Bool)

(assert (=> start!77634 (= tp!56974 b_and!26601)))

(declare-fun res!610835 () Bool)

(declare-fun e!507191 () Bool)

(assert (=> start!77634 (=> (not res!610835) (not e!507191))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77634 (= res!610835 (validMask!0 mask!1756))))

(assert (=> start!77634 e!507191))

(declare-datatypes ((V!29839 0))(
  ( (V!29840 (val!9378 Int)) )
))
(declare-datatypes ((ValueCell!8846 0))(
  ( (ValueCellFull!8846 (v!11882 V!29839)) (EmptyCell!8846) )
))
(declare-datatypes ((array!53331 0))(
  ( (array!53332 (arr!25625 (Array (_ BitVec 32) ValueCell!8846)) (size!26086 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53331)

(declare-fun e!507196 () Bool)

(declare-fun array_inv!20126 (array!53331) Bool)

(assert (=> start!77634 (and (array_inv!20126 _values!1152) e!507196)))

(assert (=> start!77634 tp!56974))

(assert (=> start!77634 true))

(declare-fun tp_is_empty!18655 () Bool)

(assert (=> start!77634 tp_is_empty!18655))

(declare-datatypes ((array!53333 0))(
  ( (array!53334 (arr!25626 (Array (_ BitVec 32) (_ BitVec 64))) (size!26087 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53333)

(declare-fun array_inv!20127 (array!53333) Bool)

(assert (=> start!77634 (array_inv!20127 _keys!1386)))

(declare-fun b!905130 () Bool)

(declare-fun e!507194 () Bool)

(assert (=> b!905130 (= e!507194 tp_is_empty!18655)))

(declare-fun b!905131 () Bool)

(declare-fun e!507193 () Bool)

(assert (=> b!905131 (= e!507193 true)))

(declare-datatypes ((tuple2!12216 0))(
  ( (tuple2!12217 (_1!6119 (_ BitVec 64)) (_2!6119 V!29839)) )
))
(declare-datatypes ((List!18013 0))(
  ( (Nil!18010) (Cons!18009 (h!19155 tuple2!12216) (t!25413 List!18013)) )
))
(declare-datatypes ((ListLongMap!10903 0))(
  ( (ListLongMap!10904 (toList!5467 List!18013)) )
))
(declare-fun lt!408295 () ListLongMap!10903)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408293 () V!29839)

(declare-fun apply!447 (ListLongMap!10903 (_ BitVec 64)) V!29839)

(assert (=> b!905131 (= (apply!447 lt!408295 k0!1033) lt!408293)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29839)

(declare-datatypes ((Unit!30642 0))(
  ( (Unit!30643) )
))
(declare-fun lt!408294 () Unit!30642)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29839)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!10 (array!53333 array!53331 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 64) V!29839 (_ BitVec 32) Int) Unit!30642)

(assert (=> b!905131 (= lt!408294 (lemmaListMapApplyFromThenApplyFromZero!10 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408293 i!717 defaultEntry!1160))))

(declare-fun b!905132 () Bool)

(declare-fun res!610832 () Bool)

(declare-fun e!507190 () Bool)

(assert (=> b!905132 (=> (not res!610832) (not e!507190))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905132 (= res!610832 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29695 () Bool)

(declare-fun mapRes!29695 () Bool)

(assert (=> mapIsEmpty!29695 mapRes!29695))

(declare-fun mapNonEmpty!29695 () Bool)

(declare-fun tp!56973 () Bool)

(assert (=> mapNonEmpty!29695 (= mapRes!29695 (and tp!56973 e!507194))))

(declare-fun mapRest!29695 () (Array (_ BitVec 32) ValueCell!8846))

(declare-fun mapKey!29695 () (_ BitVec 32))

(declare-fun mapValue!29695 () ValueCell!8846)

(assert (=> mapNonEmpty!29695 (= (arr!25625 _values!1152) (store mapRest!29695 mapKey!29695 mapValue!29695))))

(declare-fun b!905133 () Bool)

(declare-fun res!610834 () Bool)

(assert (=> b!905133 (=> (not res!610834) (not e!507191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53333 (_ BitVec 32)) Bool)

(assert (=> b!905133 (= res!610834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905134 () Bool)

(declare-fun res!610830 () Bool)

(assert (=> b!905134 (=> (not res!610830) (not e!507191))))

(assert (=> b!905134 (= res!610830 (and (= (size!26086 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26087 _keys!1386) (size!26086 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905135 () Bool)

(declare-fun res!610837 () Bool)

(assert (=> b!905135 (=> (not res!610837) (not e!507191))))

(declare-datatypes ((List!18014 0))(
  ( (Nil!18011) (Cons!18010 (h!19156 (_ BitVec 64)) (t!25414 List!18014)) )
))
(declare-fun arrayNoDuplicates!0 (array!53333 (_ BitVec 32) List!18014) Bool)

(assert (=> b!905135 (= res!610837 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18011))))

(declare-fun b!905136 () Bool)

(declare-fun e!507195 () Bool)

(assert (=> b!905136 (= e!507195 e!507193)))

(declare-fun res!610836 () Bool)

(assert (=> b!905136 (=> res!610836 e!507193)))

(declare-fun lt!408291 () ListLongMap!10903)

(declare-fun contains!4477 (ListLongMap!10903 (_ BitVec 64)) Bool)

(assert (=> b!905136 (= res!610836 (not (contains!4477 lt!408291 k0!1033)))))

(declare-fun getCurrentListMap!2681 (array!53333 array!53331 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 32) Int) ListLongMap!10903)

(assert (=> b!905136 (= lt!408291 (getCurrentListMap!2681 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905137 () Bool)

(declare-fun res!610833 () Bool)

(assert (=> b!905137 (=> res!610833 e!507193)))

(assert (=> b!905137 (= res!610833 (not (= (apply!447 lt!408291 k0!1033) lt!408293)))))

(declare-fun b!905138 () Bool)

(declare-fun e!507197 () Bool)

(assert (=> b!905138 (= e!507196 (and e!507197 mapRes!29695))))

(declare-fun condMapEmpty!29695 () Bool)

(declare-fun mapDefault!29695 () ValueCell!8846)

(assert (=> b!905138 (= condMapEmpty!29695 (= (arr!25625 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8846)) mapDefault!29695)))))

(declare-fun b!905139 () Bool)

(assert (=> b!905139 (= e!507191 e!507190)))

(declare-fun res!610838 () Bool)

(assert (=> b!905139 (=> (not res!610838) (not e!507190))))

(assert (=> b!905139 (= res!610838 (contains!4477 lt!408295 k0!1033))))

(assert (=> b!905139 (= lt!408295 (getCurrentListMap!2681 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905140 () Bool)

(assert (=> b!905140 (= e!507190 (not e!507195))))

(declare-fun res!610831 () Bool)

(assert (=> b!905140 (=> res!610831 e!507195)))

(assert (=> b!905140 (= res!610831 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26087 _keys!1386))))))

(declare-fun get!13470 (ValueCell!8846 V!29839) V!29839)

(declare-fun dynLambda!1325 (Int (_ BitVec 64)) V!29839)

(assert (=> b!905140 (= lt!408293 (get!13470 (select (arr!25625 _values!1152) i!717) (dynLambda!1325 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905140 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408292 () Unit!30642)

(declare-fun lemmaKeyInListMapIsInArray!201 (array!53333 array!53331 (_ BitVec 32) (_ BitVec 32) V!29839 V!29839 (_ BitVec 64) Int) Unit!30642)

(assert (=> b!905140 (= lt!408292 (lemmaKeyInListMapIsInArray!201 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905141 () Bool)

(assert (=> b!905141 (= e!507197 tp_is_empty!18655)))

(declare-fun b!905142 () Bool)

(declare-fun res!610839 () Bool)

(assert (=> b!905142 (=> (not res!610839) (not e!507190))))

(assert (=> b!905142 (= res!610839 (and (= (select (arr!25626 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77634 res!610835) b!905134))

(assert (= (and b!905134 res!610830) b!905133))

(assert (= (and b!905133 res!610834) b!905135))

(assert (= (and b!905135 res!610837) b!905139))

(assert (= (and b!905139 res!610838) b!905132))

(assert (= (and b!905132 res!610832) b!905142))

(assert (= (and b!905142 res!610839) b!905140))

(assert (= (and b!905140 (not res!610831)) b!905136))

(assert (= (and b!905136 (not res!610836)) b!905137))

(assert (= (and b!905137 (not res!610833)) b!905131))

(assert (= (and b!905138 condMapEmpty!29695) mapIsEmpty!29695))

(assert (= (and b!905138 (not condMapEmpty!29695)) mapNonEmpty!29695))

(get-info :version)

(assert (= (and mapNonEmpty!29695 ((_ is ValueCellFull!8846) mapValue!29695)) b!905130))

(assert (= (and b!905138 ((_ is ValueCellFull!8846) mapDefault!29695)) b!905141))

(assert (= start!77634 b!905138))

(declare-fun b_lambda!13093 () Bool)

(assert (=> (not b_lambda!13093) (not b!905140)))

(declare-fun t!25412 () Bool)

(declare-fun tb!5251 () Bool)

(assert (=> (and start!77634 (= defaultEntry!1160 defaultEntry!1160) t!25412) tb!5251))

(declare-fun result!10305 () Bool)

(assert (=> tb!5251 (= result!10305 tp_is_empty!18655)))

(assert (=> b!905140 t!25412))

(declare-fun b_and!26603 () Bool)

(assert (= b_and!26601 (and (=> t!25412 result!10305) b_and!26603)))

(declare-fun m!840017 () Bool)

(assert (=> b!905131 m!840017))

(declare-fun m!840019 () Bool)

(assert (=> b!905131 m!840019))

(declare-fun m!840021 () Bool)

(assert (=> b!905132 m!840021))

(declare-fun m!840023 () Bool)

(assert (=> b!905140 m!840023))

(declare-fun m!840025 () Bool)

(assert (=> b!905140 m!840025))

(declare-fun m!840027 () Bool)

(assert (=> b!905140 m!840027))

(declare-fun m!840029 () Bool)

(assert (=> b!905140 m!840029))

(assert (=> b!905140 m!840023))

(assert (=> b!905140 m!840027))

(declare-fun m!840031 () Bool)

(assert (=> b!905140 m!840031))

(declare-fun m!840033 () Bool)

(assert (=> mapNonEmpty!29695 m!840033))

(declare-fun m!840035 () Bool)

(assert (=> b!905142 m!840035))

(declare-fun m!840037 () Bool)

(assert (=> b!905139 m!840037))

(declare-fun m!840039 () Bool)

(assert (=> b!905139 m!840039))

(declare-fun m!840041 () Bool)

(assert (=> b!905133 m!840041))

(declare-fun m!840043 () Bool)

(assert (=> b!905135 m!840043))

(declare-fun m!840045 () Bool)

(assert (=> b!905137 m!840045))

(declare-fun m!840047 () Bool)

(assert (=> b!905136 m!840047))

(declare-fun m!840049 () Bool)

(assert (=> b!905136 m!840049))

(declare-fun m!840051 () Bool)

(assert (=> start!77634 m!840051))

(declare-fun m!840053 () Bool)

(assert (=> start!77634 m!840053))

(declare-fun m!840055 () Bool)

(assert (=> start!77634 m!840055))

(check-sat (not b!905133) (not mapNonEmpty!29695) (not b!905135) b_and!26603 (not b!905140) (not b_lambda!13093) (not b!905131) (not b_next!16237) (not b!905136) (not b!905132) tp_is_empty!18655 (not start!77634) (not b!905137) (not b!905139))
(check-sat b_and!26603 (not b_next!16237))
