; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100084 () Bool)

(assert start!100084)

(declare-fun b!1193267 () Bool)

(declare-fun e!678187 () Bool)

(assert (=> b!1193267 (= e!678187 (not true))))

(declare-datatypes ((array!77114 0))(
  ( (array!77115 (arr!37207 (Array (_ BitVec 32) (_ BitVec 64))) (size!37745 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77114)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193267 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39461 0))(
  ( (Unit!39462) )
))
(declare-fun lt!542382 () Unit!39461)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77114 (_ BitVec 64) (_ BitVec 32)) Unit!39461)

(assert (=> b!1193267 (= lt!542382 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193268 () Bool)

(declare-fun res!793913 () Bool)

(declare-fun e!678185 () Bool)

(assert (=> b!1193268 (=> (not res!793913) (not e!678185))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193268 (= res!793913 (validMask!0 mask!1564))))

(declare-fun b!1193269 () Bool)

(declare-fun res!793910 () Bool)

(assert (=> b!1193269 (=> (not res!793910) (not e!678185))))

(assert (=> b!1193269 (= res!793910 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37745 _keys!1208))))))

(declare-fun b!1193270 () Bool)

(declare-fun e!678189 () Bool)

(declare-fun e!678190 () Bool)

(declare-fun mapRes!47126 () Bool)

(assert (=> b!1193270 (= e!678189 (and e!678190 mapRes!47126))))

(declare-fun condMapEmpty!47126 () Bool)

(declare-datatypes ((V!45393 0))(
  ( (V!45394 (val!15156 Int)) )
))
(declare-datatypes ((ValueCell!14390 0))(
  ( (ValueCellFull!14390 (v!17793 V!45393)) (EmptyCell!14390) )
))
(declare-datatypes ((array!77116 0))(
  ( (array!77117 (arr!37208 (Array (_ BitVec 32) ValueCell!14390)) (size!37746 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77116)

(declare-fun mapDefault!47126 () ValueCell!14390)

(assert (=> b!1193270 (= condMapEmpty!47126 (= (arr!37208 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14390)) mapDefault!47126)))))

(declare-fun b!1193271 () Bool)

(declare-fun res!793915 () Bool)

(assert (=> b!1193271 (=> (not res!793915) (not e!678187))))

(declare-fun lt!542381 () array!77114)

(declare-datatypes ((List!26310 0))(
  ( (Nil!26307) (Cons!26306 (h!27515 (_ BitVec 64)) (t!38960 List!26310)) )
))
(declare-fun arrayNoDuplicates!0 (array!77114 (_ BitVec 32) List!26310) Bool)

(assert (=> b!1193271 (= res!793915 (arrayNoDuplicates!0 lt!542381 #b00000000000000000000000000000000 Nil!26307))))

(declare-fun mapNonEmpty!47126 () Bool)

(declare-fun tp!89718 () Bool)

(declare-fun e!678188 () Bool)

(assert (=> mapNonEmpty!47126 (= mapRes!47126 (and tp!89718 e!678188))))

(declare-fun mapValue!47126 () ValueCell!14390)

(declare-fun mapKey!47126 () (_ BitVec 32))

(declare-fun mapRest!47126 () (Array (_ BitVec 32) ValueCell!14390))

(assert (=> mapNonEmpty!47126 (= (arr!37208 _values!996) (store mapRest!47126 mapKey!47126 mapValue!47126))))

(declare-fun res!793906 () Bool)

(assert (=> start!100084 (=> (not res!793906) (not e!678185))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100084 (= res!793906 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37745 _keys!1208))))))

(assert (=> start!100084 e!678185))

(declare-fun array_inv!28488 (array!77114) Bool)

(assert (=> start!100084 (array_inv!28488 _keys!1208)))

(assert (=> start!100084 true))

(declare-fun array_inv!28489 (array!77116) Bool)

(assert (=> start!100084 (and (array_inv!28489 _values!996) e!678189)))

(declare-fun mapIsEmpty!47126 () Bool)

(assert (=> mapIsEmpty!47126 mapRes!47126))

(declare-fun b!1193272 () Bool)

(declare-fun res!793911 () Bool)

(assert (=> b!1193272 (=> (not res!793911) (not e!678185))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193272 (= res!793911 (and (= (size!37746 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37745 _keys!1208) (size!37746 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193273 () Bool)

(declare-fun res!793908 () Bool)

(assert (=> b!1193273 (=> (not res!793908) (not e!678185))))

(assert (=> b!1193273 (= res!793908 (= (select (arr!37207 _keys!1208) i!673) k0!934))))

(declare-fun b!1193274 () Bool)

(assert (=> b!1193274 (= e!678185 e!678187)))

(declare-fun res!793909 () Bool)

(assert (=> b!1193274 (=> (not res!793909) (not e!678187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77114 (_ BitVec 32)) Bool)

(assert (=> b!1193274 (= res!793909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542381 mask!1564))))

(assert (=> b!1193274 (= lt!542381 (array!77115 (store (arr!37207 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37745 _keys!1208)))))

(declare-fun b!1193275 () Bool)

(declare-fun res!793907 () Bool)

(assert (=> b!1193275 (=> (not res!793907) (not e!678185))))

(assert (=> b!1193275 (= res!793907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193276 () Bool)

(declare-fun tp_is_empty!30199 () Bool)

(assert (=> b!1193276 (= e!678190 tp_is_empty!30199)))

(declare-fun b!1193277 () Bool)

(declare-fun res!793914 () Bool)

(assert (=> b!1193277 (=> (not res!793914) (not e!678185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193277 (= res!793914 (validKeyInArray!0 k0!934))))

(declare-fun b!1193278 () Bool)

(declare-fun res!793912 () Bool)

(assert (=> b!1193278 (=> (not res!793912) (not e!678185))))

(assert (=> b!1193278 (= res!793912 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26307))))

(declare-fun b!1193279 () Bool)

(assert (=> b!1193279 (= e!678188 tp_is_empty!30199)))

(assert (= (and start!100084 res!793906) b!1193268))

(assert (= (and b!1193268 res!793913) b!1193272))

(assert (= (and b!1193272 res!793911) b!1193275))

(assert (= (and b!1193275 res!793907) b!1193278))

(assert (= (and b!1193278 res!793912) b!1193269))

(assert (= (and b!1193269 res!793910) b!1193277))

(assert (= (and b!1193277 res!793914) b!1193273))

(assert (= (and b!1193273 res!793908) b!1193274))

(assert (= (and b!1193274 res!793909) b!1193271))

(assert (= (and b!1193271 res!793915) b!1193267))

(assert (= (and b!1193270 condMapEmpty!47126) mapIsEmpty!47126))

(assert (= (and b!1193270 (not condMapEmpty!47126)) mapNonEmpty!47126))

(get-info :version)

(assert (= (and mapNonEmpty!47126 ((_ is ValueCellFull!14390) mapValue!47126)) b!1193279))

(assert (= (and b!1193270 ((_ is ValueCellFull!14390) mapDefault!47126)) b!1193276))

(assert (= start!100084 b!1193270))

(declare-fun m!1101041 () Bool)

(assert (=> b!1193278 m!1101041))

(declare-fun m!1101043 () Bool)

(assert (=> b!1193275 m!1101043))

(declare-fun m!1101045 () Bool)

(assert (=> b!1193274 m!1101045))

(declare-fun m!1101047 () Bool)

(assert (=> b!1193274 m!1101047))

(declare-fun m!1101049 () Bool)

(assert (=> mapNonEmpty!47126 m!1101049))

(declare-fun m!1101051 () Bool)

(assert (=> b!1193277 m!1101051))

(declare-fun m!1101053 () Bool)

(assert (=> b!1193268 m!1101053))

(declare-fun m!1101055 () Bool)

(assert (=> b!1193271 m!1101055))

(declare-fun m!1101057 () Bool)

(assert (=> b!1193273 m!1101057))

(declare-fun m!1101059 () Bool)

(assert (=> start!100084 m!1101059))

(declare-fun m!1101061 () Bool)

(assert (=> start!100084 m!1101061))

(declare-fun m!1101063 () Bool)

(assert (=> b!1193267 m!1101063))

(declare-fun m!1101065 () Bool)

(assert (=> b!1193267 m!1101065))

(check-sat (not mapNonEmpty!47126) (not b!1193271) (not start!100084) (not b!1193267) tp_is_empty!30199 (not b!1193274) (not b!1193268) (not b!1193275) (not b!1193277) (not b!1193278))
(check-sat)
