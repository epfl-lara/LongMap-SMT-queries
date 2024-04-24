; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100494 () Bool)

(assert start!100494)

(declare-fun b!1197194 () Bool)

(declare-fun res!796332 () Bool)

(declare-fun e!680355 () Bool)

(assert (=> b!1197194 (=> (not res!796332) (not e!680355))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197194 (= res!796332 (validKeyInArray!0 k0!934))))

(declare-fun b!1197195 () Bool)

(declare-fun res!796329 () Bool)

(assert (=> b!1197195 (=> (not res!796329) (not e!680355))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77471 0))(
  ( (array!77472 (arr!37376 (Array (_ BitVec 32) (_ BitVec 64))) (size!37913 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77471)

(assert (=> b!1197195 (= res!796329 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37913 _keys!1208))))))

(declare-fun b!1197196 () Bool)

(declare-fun res!796328 () Bool)

(assert (=> b!1197196 (=> (not res!796328) (not e!680355))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77471 (_ BitVec 32)) Bool)

(assert (=> b!1197196 (= res!796328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1197197 () Bool)

(declare-fun res!796327 () Bool)

(assert (=> b!1197197 (=> (not res!796327) (not e!680355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197197 (= res!796327 (validMask!0 mask!1564))))

(declare-fun b!1197198 () Bool)

(declare-fun res!796326 () Bool)

(assert (=> b!1197198 (=> (not res!796326) (not e!680355))))

(assert (=> b!1197198 (= res!796326 (= (select (arr!37376 _keys!1208) i!673) k0!934))))

(declare-fun b!1197199 () Bool)

(declare-fun res!796330 () Bool)

(declare-fun e!680353 () Bool)

(assert (=> b!1197199 (=> (not res!796330) (not e!680353))))

(declare-fun lt!543484 () array!77471)

(declare-datatypes ((List!26323 0))(
  ( (Nil!26320) (Cons!26319 (h!27537 (_ BitVec 64)) (t!38986 List!26323)) )
))
(declare-fun arrayNoDuplicates!0 (array!77471 (_ BitVec 32) List!26323) Bool)

(assert (=> b!1197199 (= res!796330 (arrayNoDuplicates!0 lt!543484 #b00000000000000000000000000000000 Nil!26320))))

(declare-fun mapIsEmpty!47324 () Bool)

(declare-fun mapRes!47324 () Bool)

(assert (=> mapIsEmpty!47324 mapRes!47324))

(declare-fun b!1197200 () Bool)

(declare-fun e!680357 () Bool)

(declare-fun tp_is_empty!30325 () Bool)

(assert (=> b!1197200 (= e!680357 tp_is_empty!30325)))

(declare-fun b!1197201 () Bool)

(declare-fun e!680354 () Bool)

(assert (=> b!1197201 (= e!680354 tp_is_empty!30325)))

(declare-fun b!1197202 () Bool)

(declare-fun res!796325 () Bool)

(assert (=> b!1197202 (=> (not res!796325) (not e!680355))))

(assert (=> b!1197202 (= res!796325 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26320))))

(declare-fun b!1197203 () Bool)

(declare-fun res!796334 () Bool)

(assert (=> b!1197203 (=> (not res!796334) (not e!680355))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45561 0))(
  ( (V!45562 (val!15219 Int)) )
))
(declare-datatypes ((ValueCell!14453 0))(
  ( (ValueCellFull!14453 (v!17853 V!45561)) (EmptyCell!14453) )
))
(declare-datatypes ((array!77473 0))(
  ( (array!77474 (arr!37377 (Array (_ BitVec 32) ValueCell!14453)) (size!37914 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77473)

(assert (=> b!1197203 (= res!796334 (and (= (size!37914 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37913 _keys!1208) (size!37914 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197204 () Bool)

(assert (=> b!1197204 (= e!680353 (not true))))

(declare-fun arrayContainsKey!0 (array!77471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197204 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39627 0))(
  ( (Unit!39628) )
))
(declare-fun lt!543483 () Unit!39627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77471 (_ BitVec 64) (_ BitVec 32)) Unit!39627)

(assert (=> b!1197204 (= lt!543483 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197205 () Bool)

(declare-fun e!680356 () Bool)

(assert (=> b!1197205 (= e!680356 (and e!680357 mapRes!47324))))

(declare-fun condMapEmpty!47324 () Bool)

(declare-fun mapDefault!47324 () ValueCell!14453)

(assert (=> b!1197205 (= condMapEmpty!47324 (= (arr!37377 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14453)) mapDefault!47324)))))

(declare-fun b!1197206 () Bool)

(assert (=> b!1197206 (= e!680355 e!680353)))

(declare-fun res!796331 () Bool)

(assert (=> b!1197206 (=> (not res!796331) (not e!680353))))

(assert (=> b!1197206 (= res!796331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543484 mask!1564))))

(assert (=> b!1197206 (= lt!543484 (array!77472 (store (arr!37376 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37913 _keys!1208)))))

(declare-fun mapNonEmpty!47324 () Bool)

(declare-fun tp!89934 () Bool)

(assert (=> mapNonEmpty!47324 (= mapRes!47324 (and tp!89934 e!680354))))

(declare-fun mapValue!47324 () ValueCell!14453)

(declare-fun mapRest!47324 () (Array (_ BitVec 32) ValueCell!14453))

(declare-fun mapKey!47324 () (_ BitVec 32))

(assert (=> mapNonEmpty!47324 (= (arr!37377 _values!996) (store mapRest!47324 mapKey!47324 mapValue!47324))))

(declare-fun res!796333 () Bool)

(assert (=> start!100494 (=> (not res!796333) (not e!680355))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100494 (= res!796333 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37913 _keys!1208))))))

(assert (=> start!100494 e!680355))

(declare-fun array_inv!28564 (array!77471) Bool)

(assert (=> start!100494 (array_inv!28564 _keys!1208)))

(assert (=> start!100494 true))

(declare-fun array_inv!28565 (array!77473) Bool)

(assert (=> start!100494 (and (array_inv!28565 _values!996) e!680356)))

(assert (= (and start!100494 res!796333) b!1197197))

(assert (= (and b!1197197 res!796327) b!1197203))

(assert (= (and b!1197203 res!796334) b!1197196))

(assert (= (and b!1197196 res!796328) b!1197202))

(assert (= (and b!1197202 res!796325) b!1197195))

(assert (= (and b!1197195 res!796329) b!1197194))

(assert (= (and b!1197194 res!796332) b!1197198))

(assert (= (and b!1197198 res!796326) b!1197206))

(assert (= (and b!1197206 res!796331) b!1197199))

(assert (= (and b!1197199 res!796330) b!1197204))

(assert (= (and b!1197205 condMapEmpty!47324) mapIsEmpty!47324))

(assert (= (and b!1197205 (not condMapEmpty!47324)) mapNonEmpty!47324))

(get-info :version)

(assert (= (and mapNonEmpty!47324 ((_ is ValueCellFull!14453) mapValue!47324)) b!1197201))

(assert (= (and b!1197205 ((_ is ValueCellFull!14453) mapDefault!47324)) b!1197200))

(assert (= start!100494 b!1197205))

(declare-fun m!1104891 () Bool)

(assert (=> start!100494 m!1104891))

(declare-fun m!1104893 () Bool)

(assert (=> start!100494 m!1104893))

(declare-fun m!1104895 () Bool)

(assert (=> b!1197202 m!1104895))

(declare-fun m!1104897 () Bool)

(assert (=> mapNonEmpty!47324 m!1104897))

(declare-fun m!1104899 () Bool)

(assert (=> b!1197204 m!1104899))

(declare-fun m!1104901 () Bool)

(assert (=> b!1197204 m!1104901))

(declare-fun m!1104903 () Bool)

(assert (=> b!1197196 m!1104903))

(declare-fun m!1104905 () Bool)

(assert (=> b!1197198 m!1104905))

(declare-fun m!1104907 () Bool)

(assert (=> b!1197197 m!1104907))

(declare-fun m!1104909 () Bool)

(assert (=> b!1197206 m!1104909))

(declare-fun m!1104911 () Bool)

(assert (=> b!1197206 m!1104911))

(declare-fun m!1104913 () Bool)

(assert (=> b!1197199 m!1104913))

(declare-fun m!1104915 () Bool)

(assert (=> b!1197194 m!1104915))

(check-sat tp_is_empty!30325 (not b!1197204) (not b!1197202) (not b!1197194) (not b!1197197) (not b!1197196) (not start!100494) (not b!1197199) (not mapNonEmpty!47324) (not b!1197206))
(check-sat)
