; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100210 () Bool)

(assert start!100210)

(declare-fun b!1194962 () Bool)

(declare-fun res!795125 () Bool)

(declare-fun e!679064 () Bool)

(assert (=> b!1194962 (=> (not res!795125) (not e!679064))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194962 (= res!795125 (validKeyInArray!0 k0!934))))

(declare-fun b!1194963 () Bool)

(declare-fun res!795130 () Bool)

(assert (=> b!1194963 (=> (not res!795130) (not e!679064))))

(declare-datatypes ((array!77282 0))(
  ( (array!77283 (arr!37288 (Array (_ BitVec 32) (_ BitVec 64))) (size!37826 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77282)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45505 0))(
  ( (V!45506 (val!15198 Int)) )
))
(declare-datatypes ((ValueCell!14432 0))(
  ( (ValueCellFull!14432 (v!17835 V!45505)) (EmptyCell!14432) )
))
(declare-datatypes ((array!77284 0))(
  ( (array!77285 (arr!37289 (Array (_ BitVec 32) ValueCell!14432)) (size!37827 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77284)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1194963 (= res!795130 (and (= (size!37827 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37826 _keys!1208) (size!37827 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194964 () Bool)

(declare-fun e!679069 () Bool)

(assert (=> b!1194964 (= e!679064 e!679069)))

(declare-fun res!795122 () Bool)

(assert (=> b!1194964 (=> (not res!795122) (not e!679069))))

(declare-fun lt!542682 () array!77282)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77282 (_ BitVec 32)) Bool)

(assert (=> b!1194964 (= res!795122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542682 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194964 (= lt!542682 (array!77283 (store (arr!37288 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37826 _keys!1208)))))

(declare-fun b!1194965 () Bool)

(declare-fun res!795124 () Bool)

(assert (=> b!1194965 (=> (not res!795124) (not e!679064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194965 (= res!795124 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47261 () Bool)

(declare-fun mapRes!47261 () Bool)

(assert (=> mapIsEmpty!47261 mapRes!47261))

(declare-fun b!1194966 () Bool)

(declare-fun e!679066 () Bool)

(declare-fun tp_is_empty!30283 () Bool)

(assert (=> b!1194966 (= e!679066 tp_is_empty!30283)))

(declare-fun b!1194967 () Bool)

(declare-fun res!795128 () Bool)

(assert (=> b!1194967 (=> (not res!795128) (not e!679064))))

(assert (=> b!1194967 (= res!795128 (= (select (arr!37288 _keys!1208) i!673) k0!934))))

(declare-fun b!1194968 () Bool)

(declare-fun res!795127 () Bool)

(assert (=> b!1194968 (=> (not res!795127) (not e!679064))))

(assert (=> b!1194968 (= res!795127 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37826 _keys!1208))))))

(declare-fun b!1194969 () Bool)

(declare-fun e!679068 () Bool)

(declare-fun e!679067 () Bool)

(assert (=> b!1194969 (= e!679068 (and e!679067 mapRes!47261))))

(declare-fun condMapEmpty!47261 () Bool)

(declare-fun mapDefault!47261 () ValueCell!14432)

(assert (=> b!1194969 (= condMapEmpty!47261 (= (arr!37289 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14432)) mapDefault!47261)))))

(declare-fun b!1194970 () Bool)

(declare-fun res!795121 () Bool)

(assert (=> b!1194970 (=> (not res!795121) (not e!679064))))

(declare-datatypes ((List!26347 0))(
  ( (Nil!26344) (Cons!26343 (h!27552 (_ BitVec 64)) (t!39009 List!26347)) )
))
(declare-fun arrayNoDuplicates!0 (array!77282 (_ BitVec 32) List!26347) Bool)

(assert (=> b!1194970 (= res!795121 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26344))))

(declare-fun b!1194971 () Bool)

(assert (=> b!1194971 (= e!679067 tp_is_empty!30283)))

(declare-fun mapNonEmpty!47261 () Bool)

(declare-fun tp!89871 () Bool)

(assert (=> mapNonEmpty!47261 (= mapRes!47261 (and tp!89871 e!679066))))

(declare-fun mapKey!47261 () (_ BitVec 32))

(declare-fun mapValue!47261 () ValueCell!14432)

(declare-fun mapRest!47261 () (Array (_ BitVec 32) ValueCell!14432))

(assert (=> mapNonEmpty!47261 (= (arr!37289 _values!996) (store mapRest!47261 mapKey!47261 mapValue!47261))))

(declare-fun b!1194972 () Bool)

(declare-fun res!795126 () Bool)

(assert (=> b!1194972 (=> (not res!795126) (not e!679069))))

(assert (=> b!1194972 (= res!795126 (arrayNoDuplicates!0 lt!542682 #b00000000000000000000000000000000 Nil!26344))))

(declare-fun b!1194973 () Bool)

(declare-fun res!795129 () Bool)

(assert (=> b!1194973 (=> (not res!795129) (not e!679064))))

(assert (=> b!1194973 (= res!795129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!795123 () Bool)

(assert (=> start!100210 (=> (not res!795123) (not e!679064))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100210 (= res!795123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37826 _keys!1208))))))

(assert (=> start!100210 e!679064))

(declare-fun array_inv!28546 (array!77282) Bool)

(assert (=> start!100210 (array_inv!28546 _keys!1208)))

(assert (=> start!100210 true))

(declare-fun array_inv!28547 (array!77284) Bool)

(assert (=> start!100210 (and (array_inv!28547 _values!996) e!679068)))

(declare-fun b!1194974 () Bool)

(assert (=> b!1194974 (= e!679069 (not true))))

(declare-fun arrayContainsKey!0 (array!77282 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194974 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39493 0))(
  ( (Unit!39494) )
))
(declare-fun lt!542681 () Unit!39493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77282 (_ BitVec 64) (_ BitVec 32)) Unit!39493)

(assert (=> b!1194974 (= lt!542681 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100210 res!795123) b!1194965))

(assert (= (and b!1194965 res!795124) b!1194963))

(assert (= (and b!1194963 res!795130) b!1194973))

(assert (= (and b!1194973 res!795129) b!1194970))

(assert (= (and b!1194970 res!795121) b!1194968))

(assert (= (and b!1194968 res!795127) b!1194962))

(assert (= (and b!1194962 res!795125) b!1194967))

(assert (= (and b!1194967 res!795128) b!1194964))

(assert (= (and b!1194964 res!795122) b!1194972))

(assert (= (and b!1194972 res!795126) b!1194974))

(assert (= (and b!1194969 condMapEmpty!47261) mapIsEmpty!47261))

(assert (= (and b!1194969 (not condMapEmpty!47261)) mapNonEmpty!47261))

(get-info :version)

(assert (= (and mapNonEmpty!47261 ((_ is ValueCellFull!14432) mapValue!47261)) b!1194966))

(assert (= (and b!1194969 ((_ is ValueCellFull!14432) mapDefault!47261)) b!1194971))

(assert (= start!100210 b!1194969))

(declare-fun m!1102163 () Bool)

(assert (=> b!1194970 m!1102163))

(declare-fun m!1102165 () Bool)

(assert (=> b!1194974 m!1102165))

(declare-fun m!1102167 () Bool)

(assert (=> b!1194974 m!1102167))

(declare-fun m!1102169 () Bool)

(assert (=> b!1194965 m!1102169))

(declare-fun m!1102171 () Bool)

(assert (=> b!1194964 m!1102171))

(declare-fun m!1102173 () Bool)

(assert (=> b!1194964 m!1102173))

(declare-fun m!1102175 () Bool)

(assert (=> b!1194967 m!1102175))

(declare-fun m!1102177 () Bool)

(assert (=> b!1194973 m!1102177))

(declare-fun m!1102179 () Bool)

(assert (=> b!1194972 m!1102179))

(declare-fun m!1102181 () Bool)

(assert (=> mapNonEmpty!47261 m!1102181))

(declare-fun m!1102183 () Bool)

(assert (=> b!1194962 m!1102183))

(declare-fun m!1102185 () Bool)

(assert (=> start!100210 m!1102185))

(declare-fun m!1102187 () Bool)

(assert (=> start!100210 m!1102187))

(check-sat (not b!1194970) tp_is_empty!30283 (not b!1194972) (not start!100210) (not b!1194965) (not mapNonEmpty!47261) (not b!1194962) (not b!1194973) (not b!1194964) (not b!1194974))
(check-sat)
