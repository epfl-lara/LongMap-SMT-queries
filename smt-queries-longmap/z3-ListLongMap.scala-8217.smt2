; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100204 () Bool)

(assert start!100204)

(declare-fun b!1194845 () Bool)

(declare-fun e!679014 () Bool)

(declare-fun tp_is_empty!30277 () Bool)

(assert (=> b!1194845 (= e!679014 tp_is_empty!30277)))

(declare-fun b!1194846 () Bool)

(declare-fun res!795032 () Bool)

(declare-fun e!679015 () Bool)

(assert (=> b!1194846 (=> (not res!795032) (not e!679015))))

(declare-datatypes ((array!77270 0))(
  ( (array!77271 (arr!37282 (Array (_ BitVec 32) (_ BitVec 64))) (size!37820 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77270)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45497 0))(
  ( (V!45498 (val!15195 Int)) )
))
(declare-datatypes ((ValueCell!14429 0))(
  ( (ValueCellFull!14429 (v!17832 V!45497)) (EmptyCell!14429) )
))
(declare-datatypes ((array!77272 0))(
  ( (array!77273 (arr!37283 (Array (_ BitVec 32) ValueCell!14429)) (size!37821 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77272)

(assert (=> b!1194846 (= res!795032 (and (= (size!37821 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37820 _keys!1208) (size!37821 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194847 () Bool)

(declare-fun res!795035 () Bool)

(declare-fun e!679011 () Bool)

(assert (=> b!1194847 (=> (not res!795035) (not e!679011))))

(declare-fun lt!542663 () array!77270)

(declare-datatypes ((List!26345 0))(
  ( (Nil!26342) (Cons!26341 (h!27550 (_ BitVec 64)) (t!39007 List!26345)) )
))
(declare-fun arrayNoDuplicates!0 (array!77270 (_ BitVec 32) List!26345) Bool)

(assert (=> b!1194847 (= res!795035 (arrayNoDuplicates!0 lt!542663 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun mapIsEmpty!47252 () Bool)

(declare-fun mapRes!47252 () Bool)

(assert (=> mapIsEmpty!47252 mapRes!47252))

(declare-fun b!1194848 () Bool)

(declare-fun e!679013 () Bool)

(assert (=> b!1194848 (= e!679013 tp_is_empty!30277)))

(declare-fun b!1194849 () Bool)

(declare-fun res!795038 () Bool)

(assert (=> b!1194849 (=> (not res!795038) (not e!679015))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194849 (= res!795038 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37820 _keys!1208))))))

(declare-fun b!1194850 () Bool)

(assert (=> b!1194850 (= e!679011 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194850 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39489 0))(
  ( (Unit!39490) )
))
(declare-fun lt!542664 () Unit!39489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77270 (_ BitVec 64) (_ BitVec 32)) Unit!39489)

(assert (=> b!1194850 (= lt!542664 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194851 () Bool)

(declare-fun e!679010 () Bool)

(assert (=> b!1194851 (= e!679010 (and e!679014 mapRes!47252))))

(declare-fun condMapEmpty!47252 () Bool)

(declare-fun mapDefault!47252 () ValueCell!14429)

(assert (=> b!1194851 (= condMapEmpty!47252 (= (arr!37283 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14429)) mapDefault!47252)))))

(declare-fun mapNonEmpty!47252 () Bool)

(declare-fun tp!89862 () Bool)

(assert (=> mapNonEmpty!47252 (= mapRes!47252 (and tp!89862 e!679013))))

(declare-fun mapRest!47252 () (Array (_ BitVec 32) ValueCell!14429))

(declare-fun mapValue!47252 () ValueCell!14429)

(declare-fun mapKey!47252 () (_ BitVec 32))

(assert (=> mapNonEmpty!47252 (= (arr!37283 _values!996) (store mapRest!47252 mapKey!47252 mapValue!47252))))

(declare-fun b!1194852 () Bool)

(declare-fun res!795033 () Bool)

(assert (=> b!1194852 (=> (not res!795033) (not e!679015))))

(assert (=> b!1194852 (= res!795033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26342))))

(declare-fun b!1194853 () Bool)

(assert (=> b!1194853 (= e!679015 e!679011)))

(declare-fun res!795036 () Bool)

(assert (=> b!1194853 (=> (not res!795036) (not e!679011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77270 (_ BitVec 32)) Bool)

(assert (=> b!1194853 (= res!795036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542663 mask!1564))))

(assert (=> b!1194853 (= lt!542663 (array!77271 (store (arr!37282 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37820 _keys!1208)))))

(declare-fun res!795031 () Bool)

(assert (=> start!100204 (=> (not res!795031) (not e!679015))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100204 (= res!795031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37820 _keys!1208))))))

(assert (=> start!100204 e!679015))

(declare-fun array_inv!28540 (array!77270) Bool)

(assert (=> start!100204 (array_inv!28540 _keys!1208)))

(assert (=> start!100204 true))

(declare-fun array_inv!28541 (array!77272) Bool)

(assert (=> start!100204 (and (array_inv!28541 _values!996) e!679010)))

(declare-fun b!1194854 () Bool)

(declare-fun res!795039 () Bool)

(assert (=> b!1194854 (=> (not res!795039) (not e!679015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194854 (= res!795039 (validKeyInArray!0 k0!934))))

(declare-fun b!1194855 () Bool)

(declare-fun res!795037 () Bool)

(assert (=> b!1194855 (=> (not res!795037) (not e!679015))))

(assert (=> b!1194855 (= res!795037 (= (select (arr!37282 _keys!1208) i!673) k0!934))))

(declare-fun b!1194856 () Bool)

(declare-fun res!795040 () Bool)

(assert (=> b!1194856 (=> (not res!795040) (not e!679015))))

(assert (=> b!1194856 (= res!795040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1194857 () Bool)

(declare-fun res!795034 () Bool)

(assert (=> b!1194857 (=> (not res!795034) (not e!679015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194857 (= res!795034 (validMask!0 mask!1564))))

(assert (= (and start!100204 res!795031) b!1194857))

(assert (= (and b!1194857 res!795034) b!1194846))

(assert (= (and b!1194846 res!795032) b!1194856))

(assert (= (and b!1194856 res!795040) b!1194852))

(assert (= (and b!1194852 res!795033) b!1194849))

(assert (= (and b!1194849 res!795038) b!1194854))

(assert (= (and b!1194854 res!795039) b!1194855))

(assert (= (and b!1194855 res!795037) b!1194853))

(assert (= (and b!1194853 res!795036) b!1194847))

(assert (= (and b!1194847 res!795035) b!1194850))

(assert (= (and b!1194851 condMapEmpty!47252) mapIsEmpty!47252))

(assert (= (and b!1194851 (not condMapEmpty!47252)) mapNonEmpty!47252))

(get-info :version)

(assert (= (and mapNonEmpty!47252 ((_ is ValueCellFull!14429) mapValue!47252)) b!1194848))

(assert (= (and b!1194851 ((_ is ValueCellFull!14429) mapDefault!47252)) b!1194845))

(assert (= start!100204 b!1194851))

(declare-fun m!1102085 () Bool)

(assert (=> b!1194850 m!1102085))

(declare-fun m!1102087 () Bool)

(assert (=> b!1194850 m!1102087))

(declare-fun m!1102089 () Bool)

(assert (=> b!1194857 m!1102089))

(declare-fun m!1102091 () Bool)

(assert (=> b!1194852 m!1102091))

(declare-fun m!1102093 () Bool)

(assert (=> b!1194853 m!1102093))

(declare-fun m!1102095 () Bool)

(assert (=> b!1194853 m!1102095))

(declare-fun m!1102097 () Bool)

(assert (=> start!100204 m!1102097))

(declare-fun m!1102099 () Bool)

(assert (=> start!100204 m!1102099))

(declare-fun m!1102101 () Bool)

(assert (=> b!1194855 m!1102101))

(declare-fun m!1102103 () Bool)

(assert (=> b!1194856 m!1102103))

(declare-fun m!1102105 () Bool)

(assert (=> b!1194847 m!1102105))

(declare-fun m!1102107 () Bool)

(assert (=> mapNonEmpty!47252 m!1102107))

(declare-fun m!1102109 () Bool)

(assert (=> b!1194854 m!1102109))

(check-sat (not b!1194853) (not b!1194850) (not mapNonEmpty!47252) (not b!1194847) (not b!1194857) tp_is_empty!30277 (not b!1194852) (not b!1194856) (not b!1194854) (not start!100204))
(check-sat)
