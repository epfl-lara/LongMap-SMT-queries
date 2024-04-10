; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99064 () Bool)

(assert start!99064)

(declare-fun b_free!24669 () Bool)

(declare-fun b_next!24669 () Bool)

(assert (=> start!99064 (= b_free!24669 (not b_next!24669))))

(declare-fun tp!86718 () Bool)

(declare-fun b_and!40187 () Bool)

(assert (=> start!99064 (= tp!86718 b_and!40187)))

(declare-fun b!1164842 () Bool)

(declare-fun e!662259 () Bool)

(declare-fun e!662258 () Bool)

(assert (=> b!1164842 (= e!662259 e!662258)))

(declare-fun res!772487 () Bool)

(assert (=> b!1164842 (=> (not res!772487) (not e!662258))))

(declare-datatypes ((array!75229 0))(
  ( (array!75230 (arr!36265 (Array (_ BitVec 32) (_ BitVec 64))) (size!36801 (_ BitVec 32))) )
))
(declare-fun lt!524749 () array!75229)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75229 (_ BitVec 32)) Bool)

(assert (=> b!1164842 (= res!772487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524749 mask!1564))))

(declare-fun _keys!1208 () array!75229)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1164842 (= lt!524749 (array!75230 (store (arr!36265 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36801 _keys!1208)))))

(declare-fun b!1164843 () Bool)

(declare-fun res!772488 () Bool)

(assert (=> b!1164843 (=> (not res!772488) (not e!662259))))

(assert (=> b!1164843 (= res!772488 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36801 _keys!1208))))))

(declare-fun b!1164844 () Bool)

(declare-fun e!662257 () Bool)

(assert (=> b!1164844 (= e!662257 true)))

(declare-datatypes ((V!44059 0))(
  ( (V!44060 (val!14656 Int)) )
))
(declare-fun zeroValue!944 () V!44059)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13890 0))(
  ( (ValueCellFull!13890 (v!17293 V!44059)) (EmptyCell!13890) )
))
(declare-datatypes ((array!75231 0))(
  ( (array!75232 (arr!36266 (Array (_ BitVec 32) ValueCell!13890)) (size!36802 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75231)

(declare-fun minValue!944 () V!44059)

(declare-datatypes ((tuple2!18690 0))(
  ( (tuple2!18691 (_1!9356 (_ BitVec 64)) (_2!9356 V!44059)) )
))
(declare-datatypes ((List!25423 0))(
  ( (Nil!25420) (Cons!25419 (h!26628 tuple2!18690) (t!37084 List!25423)) )
))
(declare-datatypes ((ListLongMap!16659 0))(
  ( (ListLongMap!16660 (toList!8345 List!25423)) )
))
(declare-fun lt!524748 () ListLongMap!16659)

(declare-fun getCurrentListMapNoExtraKeys!4809 (array!75229 array!75231 (_ BitVec 32) (_ BitVec 32) V!44059 V!44059 (_ BitVec 32) Int) ListLongMap!16659)

(declare-fun dynLambda!2799 (Int (_ BitVec 64)) V!44059)

(assert (=> b!1164844 (= lt!524748 (getCurrentListMapNoExtraKeys!4809 lt!524749 (array!75232 (store (arr!36266 _values!996) i!673 (ValueCellFull!13890 (dynLambda!2799 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36802 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524751 () ListLongMap!16659)

(assert (=> b!1164844 (= lt!524751 (getCurrentListMapNoExtraKeys!4809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1164845 () Bool)

(declare-fun res!772483 () Bool)

(assert (=> b!1164845 (=> (not res!772483) (not e!662258))))

(declare-datatypes ((List!25424 0))(
  ( (Nil!25421) (Cons!25420 (h!26629 (_ BitVec 64)) (t!37085 List!25424)) )
))
(declare-fun arrayNoDuplicates!0 (array!75229 (_ BitVec 32) List!25424) Bool)

(assert (=> b!1164845 (= res!772483 (arrayNoDuplicates!0 lt!524749 #b00000000000000000000000000000000 Nil!25421))))

(declare-fun b!1164846 () Bool)

(declare-fun res!772490 () Bool)

(assert (=> b!1164846 (=> (not res!772490) (not e!662259))))

(assert (=> b!1164846 (= res!772490 (and (= (size!36802 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36801 _keys!1208) (size!36802 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164847 () Bool)

(declare-fun res!772491 () Bool)

(assert (=> b!1164847 (=> (not res!772491) (not e!662259))))

(assert (=> b!1164847 (= res!772491 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25421))))

(declare-fun b!1164848 () Bool)

(declare-fun res!772492 () Bool)

(assert (=> b!1164848 (=> (not res!772492) (not e!662259))))

(assert (=> b!1164848 (= res!772492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1164849 () Bool)

(assert (=> b!1164849 (= e!662258 (not e!662257))))

(declare-fun res!772486 () Bool)

(assert (=> b!1164849 (=> res!772486 e!662257)))

(assert (=> b!1164849 (= res!772486 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164849 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38440 0))(
  ( (Unit!38441) )
))
(declare-fun lt!524750 () Unit!38440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75229 (_ BitVec 64) (_ BitVec 32)) Unit!38440)

(assert (=> b!1164849 (= lt!524750 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164850 () Bool)

(declare-fun res!772489 () Bool)

(assert (=> b!1164850 (=> (not res!772489) (not e!662259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164850 (= res!772489 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45623 () Bool)

(declare-fun mapRes!45623 () Bool)

(assert (=> mapIsEmpty!45623 mapRes!45623))

(declare-fun b!1164851 () Bool)

(declare-fun res!772485 () Bool)

(assert (=> b!1164851 (=> (not res!772485) (not e!662259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164851 (= res!772485 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45623 () Bool)

(declare-fun tp!86717 () Bool)

(declare-fun e!662256 () Bool)

(assert (=> mapNonEmpty!45623 (= mapRes!45623 (and tp!86717 e!662256))))

(declare-fun mapValue!45623 () ValueCell!13890)

(declare-fun mapKey!45623 () (_ BitVec 32))

(declare-fun mapRest!45623 () (Array (_ BitVec 32) ValueCell!13890))

(assert (=> mapNonEmpty!45623 (= (arr!36266 _values!996) (store mapRest!45623 mapKey!45623 mapValue!45623))))

(declare-fun res!772484 () Bool)

(assert (=> start!99064 (=> (not res!772484) (not e!662259))))

(assert (=> start!99064 (= res!772484 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36801 _keys!1208))))))

(assert (=> start!99064 e!662259))

(declare-fun tp_is_empty!29199 () Bool)

(assert (=> start!99064 tp_is_empty!29199))

(declare-fun array_inv!27742 (array!75229) Bool)

(assert (=> start!99064 (array_inv!27742 _keys!1208)))

(assert (=> start!99064 true))

(assert (=> start!99064 tp!86718))

(declare-fun e!662254 () Bool)

(declare-fun array_inv!27743 (array!75231) Bool)

(assert (=> start!99064 (and (array_inv!27743 _values!996) e!662254)))

(declare-fun b!1164852 () Bool)

(declare-fun e!662253 () Bool)

(assert (=> b!1164852 (= e!662254 (and e!662253 mapRes!45623))))

(declare-fun condMapEmpty!45623 () Bool)

(declare-fun mapDefault!45623 () ValueCell!13890)

(assert (=> b!1164852 (= condMapEmpty!45623 (= (arr!36266 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13890)) mapDefault!45623)))))

(declare-fun b!1164853 () Bool)

(assert (=> b!1164853 (= e!662256 tp_is_empty!29199)))

(declare-fun b!1164854 () Bool)

(assert (=> b!1164854 (= e!662253 tp_is_empty!29199)))

(declare-fun b!1164855 () Bool)

(declare-fun res!772493 () Bool)

(assert (=> b!1164855 (=> (not res!772493) (not e!662259))))

(assert (=> b!1164855 (= res!772493 (= (select (arr!36265 _keys!1208) i!673) k0!934))))

(assert (= (and start!99064 res!772484) b!1164850))

(assert (= (and b!1164850 res!772489) b!1164846))

(assert (= (and b!1164846 res!772490) b!1164848))

(assert (= (and b!1164848 res!772492) b!1164847))

(assert (= (and b!1164847 res!772491) b!1164843))

(assert (= (and b!1164843 res!772488) b!1164851))

(assert (= (and b!1164851 res!772485) b!1164855))

(assert (= (and b!1164855 res!772493) b!1164842))

(assert (= (and b!1164842 res!772487) b!1164845))

(assert (= (and b!1164845 res!772483) b!1164849))

(assert (= (and b!1164849 (not res!772486)) b!1164844))

(assert (= (and b!1164852 condMapEmpty!45623) mapIsEmpty!45623))

(assert (= (and b!1164852 (not condMapEmpty!45623)) mapNonEmpty!45623))

(get-info :version)

(assert (= (and mapNonEmpty!45623 ((_ is ValueCellFull!13890) mapValue!45623)) b!1164853))

(assert (= (and b!1164852 ((_ is ValueCellFull!13890) mapDefault!45623)) b!1164854))

(assert (= start!99064 b!1164852))

(declare-fun b_lambda!19775 () Bool)

(assert (=> (not b_lambda!19775) (not b!1164844)))

(declare-fun t!37083 () Bool)

(declare-fun tb!9481 () Bool)

(assert (=> (and start!99064 (= defaultEntry!1004 defaultEntry!1004) t!37083) tb!9481))

(declare-fun result!19527 () Bool)

(assert (=> tb!9481 (= result!19527 tp_is_empty!29199)))

(assert (=> b!1164844 t!37083))

(declare-fun b_and!40189 () Bool)

(assert (= b_and!40187 (and (=> t!37083 result!19527) b_and!40189)))

(declare-fun m!1073175 () Bool)

(assert (=> b!1164847 m!1073175))

(declare-fun m!1073177 () Bool)

(assert (=> b!1164844 m!1073177))

(declare-fun m!1073179 () Bool)

(assert (=> b!1164844 m!1073179))

(declare-fun m!1073181 () Bool)

(assert (=> b!1164844 m!1073181))

(declare-fun m!1073183 () Bool)

(assert (=> b!1164844 m!1073183))

(declare-fun m!1073185 () Bool)

(assert (=> start!99064 m!1073185))

(declare-fun m!1073187 () Bool)

(assert (=> start!99064 m!1073187))

(declare-fun m!1073189 () Bool)

(assert (=> mapNonEmpty!45623 m!1073189))

(declare-fun m!1073191 () Bool)

(assert (=> b!1164855 m!1073191))

(declare-fun m!1073193 () Bool)

(assert (=> b!1164845 m!1073193))

(declare-fun m!1073195 () Bool)

(assert (=> b!1164850 m!1073195))

(declare-fun m!1073197 () Bool)

(assert (=> b!1164851 m!1073197))

(declare-fun m!1073199 () Bool)

(assert (=> b!1164849 m!1073199))

(declare-fun m!1073201 () Bool)

(assert (=> b!1164849 m!1073201))

(declare-fun m!1073203 () Bool)

(assert (=> b!1164848 m!1073203))

(declare-fun m!1073205 () Bool)

(assert (=> b!1164842 m!1073205))

(declare-fun m!1073207 () Bool)

(assert (=> b!1164842 m!1073207))

(check-sat (not b!1164842) (not b!1164848) (not b!1164850) (not mapNonEmpty!45623) tp_is_empty!29199 (not b_next!24669) b_and!40189 (not b!1164849) (not b!1164847) (not b_lambda!19775) (not b!1164851) (not b!1164845) (not b!1164844) (not start!99064))
(check-sat b_and!40189 (not b_next!24669))
