; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100708 () Bool)

(assert start!100708)

(declare-fun b_free!25795 () Bool)

(declare-fun b_next!25795 () Bool)

(assert (=> start!100708 (= b_free!25795 (not b_next!25795))))

(declare-fun tp!90374 () Bool)

(declare-fun b_and!42479 () Bool)

(assert (=> start!100708 (= tp!90374 b_and!42479)))

(declare-fun b!1201181 () Bool)

(declare-fun e!682293 () Bool)

(declare-fun e!682294 () Bool)

(declare-fun mapRes!47591 () Bool)

(assert (=> b!1201181 (= e!682293 (and e!682294 mapRes!47591))))

(declare-fun condMapEmpty!47591 () Bool)

(declare-datatypes ((V!45793 0))(
  ( (V!45794 (val!15306 Int)) )
))
(declare-datatypes ((ValueCell!14540 0))(
  ( (ValueCellFull!14540 (v!17940 V!45793)) (EmptyCell!14540) )
))
(declare-datatypes ((array!77811 0))(
  ( (array!77812 (arr!37544 (Array (_ BitVec 32) ValueCell!14540)) (size!38081 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77811)

(declare-fun mapDefault!47591 () ValueCell!14540)

(assert (=> b!1201181 (= condMapEmpty!47591 (= (arr!37544 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14540)) mapDefault!47591)))))

(declare-fun mapIsEmpty!47591 () Bool)

(assert (=> mapIsEmpty!47591 mapRes!47591))

(declare-fun b!1201182 () Bool)

(declare-fun res!799203 () Bool)

(declare-fun e!682298 () Bool)

(assert (=> b!1201182 (=> (not res!799203) (not e!682298))))

(declare-datatypes ((array!77813 0))(
  ( (array!77814 (arr!37545 (Array (_ BitVec 32) (_ BitVec 64))) (size!38082 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77813)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77813 (_ BitVec 32)) Bool)

(assert (=> b!1201182 (= res!799203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47591 () Bool)

(declare-fun tp!90375 () Bool)

(declare-fun e!682297 () Bool)

(assert (=> mapNonEmpty!47591 (= mapRes!47591 (and tp!90375 e!682297))))

(declare-fun mapValue!47591 () ValueCell!14540)

(declare-fun mapKey!47591 () (_ BitVec 32))

(declare-fun mapRest!47591 () (Array (_ BitVec 32) ValueCell!14540))

(assert (=> mapNonEmpty!47591 (= (arr!37544 _values!996) (store mapRest!47591 mapKey!47591 mapValue!47591))))

(declare-fun b!1201183 () Bool)

(declare-fun res!799204 () Bool)

(assert (=> b!1201183 (=> (not res!799204) (not e!682298))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1201183 (= res!799204 (and (= (size!38081 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38082 _keys!1208) (size!38081 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!799206 () Bool)

(assert (=> start!100708 (=> (not res!799206) (not e!682298))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100708 (= res!799206 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38082 _keys!1208))))))

(assert (=> start!100708 e!682298))

(declare-fun tp_is_empty!30499 () Bool)

(assert (=> start!100708 tp_is_empty!30499))

(declare-fun array_inv!28680 (array!77813) Bool)

(assert (=> start!100708 (array_inv!28680 _keys!1208)))

(assert (=> start!100708 true))

(assert (=> start!100708 tp!90374))

(declare-fun array_inv!28681 (array!77811) Bool)

(assert (=> start!100708 (and (array_inv!28681 _values!996) e!682293)))

(declare-fun b!1201184 () Bool)

(declare-fun e!682296 () Bool)

(assert (=> b!1201184 (= e!682298 e!682296)))

(declare-fun res!799208 () Bool)

(assert (=> b!1201184 (=> (not res!799208) (not e!682296))))

(declare-fun lt!544378 () array!77813)

(assert (=> b!1201184 (= res!799208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544378 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1201184 (= lt!544378 (array!77814 (store (arr!37545 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38082 _keys!1208)))))

(declare-fun b!1201185 () Bool)

(declare-fun res!799211 () Bool)

(assert (=> b!1201185 (=> (not res!799211) (not e!682298))))

(declare-datatypes ((List!26429 0))(
  ( (Nil!26426) (Cons!26425 (h!27643 (_ BitVec 64)) (t!39196 List!26429)) )
))
(declare-fun arrayNoDuplicates!0 (array!77813 (_ BitVec 32) List!26429) Bool)

(assert (=> b!1201185 (= res!799211 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26426))))

(declare-fun b!1201186 () Bool)

(declare-fun e!682292 () Bool)

(assert (=> b!1201186 (= e!682296 (not e!682292))))

(declare-fun res!799205 () Bool)

(assert (=> b!1201186 (=> res!799205 e!682292)))

(assert (=> b!1201186 (= res!799205 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201186 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39749 0))(
  ( (Unit!39750) )
))
(declare-fun lt!544377 () Unit!39749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77813 (_ BitVec 64) (_ BitVec 32)) Unit!39749)

(assert (=> b!1201186 (= lt!544377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201187 () Bool)

(declare-fun res!799213 () Bool)

(assert (=> b!1201187 (=> (not res!799213) (not e!682298))))

(assert (=> b!1201187 (= res!799213 (= (select (arr!37545 _keys!1208) i!673) k0!934))))

(declare-fun b!1201188 () Bool)

(declare-fun res!799212 () Bool)

(assert (=> b!1201188 (=> (not res!799212) (not e!682298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201188 (= res!799212 (validKeyInArray!0 k0!934))))

(declare-fun b!1201189 () Bool)

(declare-fun res!799210 () Bool)

(assert (=> b!1201189 (=> (not res!799210) (not e!682298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201189 (= res!799210 (validMask!0 mask!1564))))

(declare-fun b!1201190 () Bool)

(assert (=> b!1201190 (= e!682294 tp_is_empty!30499)))

(declare-fun b!1201191 () Bool)

(assert (=> b!1201191 (= e!682297 tp_is_empty!30499)))

(declare-fun b!1201192 () Bool)

(declare-fun res!799209 () Bool)

(assert (=> b!1201192 (=> (not res!799209) (not e!682296))))

(assert (=> b!1201192 (= res!799209 (arrayNoDuplicates!0 lt!544378 #b00000000000000000000000000000000 Nil!26426))))

(declare-fun b!1201193 () Bool)

(declare-fun res!799207 () Bool)

(assert (=> b!1201193 (=> (not res!799207) (not e!682298))))

(assert (=> b!1201193 (= res!799207 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38082 _keys!1208))))))

(declare-fun b!1201194 () Bool)

(assert (=> b!1201194 (= e!682292 true)))

(declare-fun zeroValue!944 () V!45793)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45793)

(declare-datatypes ((tuple2!19610 0))(
  ( (tuple2!19611 (_1!9816 (_ BitVec 64)) (_2!9816 V!45793)) )
))
(declare-datatypes ((List!26430 0))(
  ( (Nil!26427) (Cons!26426 (h!27644 tuple2!19610) (t!39197 List!26430)) )
))
(declare-datatypes ((ListLongMap!17587 0))(
  ( (ListLongMap!17588 (toList!8809 List!26430)) )
))
(declare-fun lt!544379 () ListLongMap!17587)

(declare-fun getCurrentListMapNoExtraKeys!5276 (array!77813 array!77811 (_ BitVec 32) (_ BitVec 32) V!45793 V!45793 (_ BitVec 32) Int) ListLongMap!17587)

(declare-fun dynLambda!3220 (Int (_ BitVec 64)) V!45793)

(assert (=> b!1201194 (= lt!544379 (getCurrentListMapNoExtraKeys!5276 lt!544378 (array!77812 (store (arr!37544 _values!996) i!673 (ValueCellFull!14540 (dynLambda!3220 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38081 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544376 () ListLongMap!17587)

(assert (=> b!1201194 (= lt!544376 (getCurrentListMapNoExtraKeys!5276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100708 res!799206) b!1201189))

(assert (= (and b!1201189 res!799210) b!1201183))

(assert (= (and b!1201183 res!799204) b!1201182))

(assert (= (and b!1201182 res!799203) b!1201185))

(assert (= (and b!1201185 res!799211) b!1201193))

(assert (= (and b!1201193 res!799207) b!1201188))

(assert (= (and b!1201188 res!799212) b!1201187))

(assert (= (and b!1201187 res!799213) b!1201184))

(assert (= (and b!1201184 res!799208) b!1201192))

(assert (= (and b!1201192 res!799209) b!1201186))

(assert (= (and b!1201186 (not res!799205)) b!1201194))

(assert (= (and b!1201181 condMapEmpty!47591) mapIsEmpty!47591))

(assert (= (and b!1201181 (not condMapEmpty!47591)) mapNonEmpty!47591))

(get-info :version)

(assert (= (and mapNonEmpty!47591 ((_ is ValueCellFull!14540) mapValue!47591)) b!1201191))

(assert (= (and b!1201181 ((_ is ValueCellFull!14540) mapDefault!47591)) b!1201190))

(assert (= start!100708 b!1201181))

(declare-fun b_lambda!20985 () Bool)

(assert (=> (not b_lambda!20985) (not b!1201194)))

(declare-fun t!39195 () Bool)

(declare-fun tb!10587 () Bool)

(assert (=> (and start!100708 (= defaultEntry!1004 defaultEntry!1004) t!39195) tb!10587))

(declare-fun result!21759 () Bool)

(assert (=> tb!10587 (= result!21759 tp_is_empty!30499)))

(assert (=> b!1201194 t!39195))

(declare-fun b_and!42481 () Bool)

(assert (= b_and!42479 (and (=> t!39195 result!21759) b_and!42481)))

(declare-fun m!1107899 () Bool)

(assert (=> b!1201184 m!1107899))

(declare-fun m!1107901 () Bool)

(assert (=> b!1201184 m!1107901))

(declare-fun m!1107903 () Bool)

(assert (=> start!100708 m!1107903))

(declare-fun m!1107905 () Bool)

(assert (=> start!100708 m!1107905))

(declare-fun m!1107907 () Bool)

(assert (=> b!1201194 m!1107907))

(declare-fun m!1107909 () Bool)

(assert (=> b!1201194 m!1107909))

(declare-fun m!1107911 () Bool)

(assert (=> b!1201194 m!1107911))

(declare-fun m!1107913 () Bool)

(assert (=> b!1201194 m!1107913))

(declare-fun m!1107915 () Bool)

(assert (=> b!1201188 m!1107915))

(declare-fun m!1107917 () Bool)

(assert (=> b!1201189 m!1107917))

(declare-fun m!1107919 () Bool)

(assert (=> b!1201182 m!1107919))

(declare-fun m!1107921 () Bool)

(assert (=> b!1201187 m!1107921))

(declare-fun m!1107923 () Bool)

(assert (=> b!1201192 m!1107923))

(declare-fun m!1107925 () Bool)

(assert (=> b!1201186 m!1107925))

(declare-fun m!1107927 () Bool)

(assert (=> b!1201186 m!1107927))

(declare-fun m!1107929 () Bool)

(assert (=> b!1201185 m!1107929))

(declare-fun m!1107931 () Bool)

(assert (=> mapNonEmpty!47591 m!1107931))

(check-sat (not b!1201192) (not b!1201194) (not start!100708) (not b!1201182) (not b!1201184) (not b!1201188) (not b!1201189) (not b_lambda!20985) (not mapNonEmpty!47591) b_and!42481 (not b_next!25795) (not b!1201186) tp_is_empty!30499 (not b!1201185))
(check-sat b_and!42481 (not b_next!25795))
