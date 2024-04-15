; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100222 () Bool)

(assert start!100222)

(declare-fun b!1195196 () Bool)

(declare-fun res!795305 () Bool)

(declare-fun e!679172 () Bool)

(assert (=> b!1195196 (=> (not res!795305) (not e!679172))))

(declare-datatypes ((array!77304 0))(
  ( (array!77305 (arr!37299 (Array (_ BitVec 32) (_ BitVec 64))) (size!37837 (_ BitVec 32))) )
))
(declare-fun lt!542718 () array!77304)

(declare-datatypes ((List!26352 0))(
  ( (Nil!26349) (Cons!26348 (h!27557 (_ BitVec 64)) (t!39014 List!26352)) )
))
(declare-fun arrayNoDuplicates!0 (array!77304 (_ BitVec 32) List!26352) Bool)

(assert (=> b!1195196 (= res!795305 (arrayNoDuplicates!0 lt!542718 #b00000000000000000000000000000000 Nil!26349))))

(declare-fun b!1195197 () Bool)

(declare-fun e!679174 () Bool)

(declare-fun e!679176 () Bool)

(declare-fun mapRes!47279 () Bool)

(assert (=> b!1195197 (= e!679174 (and e!679176 mapRes!47279))))

(declare-fun condMapEmpty!47279 () Bool)

(declare-datatypes ((V!45521 0))(
  ( (V!45522 (val!15204 Int)) )
))
(declare-datatypes ((ValueCell!14438 0))(
  ( (ValueCellFull!14438 (v!17841 V!45521)) (EmptyCell!14438) )
))
(declare-datatypes ((array!77306 0))(
  ( (array!77307 (arr!37300 (Array (_ BitVec 32) ValueCell!14438)) (size!37838 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77306)

(declare-fun mapDefault!47279 () ValueCell!14438)

(assert (=> b!1195197 (= condMapEmpty!47279 (= (arr!37300 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14438)) mapDefault!47279)))))

(declare-fun mapNonEmpty!47279 () Bool)

(declare-fun tp!89889 () Bool)

(declare-fun e!679177 () Bool)

(assert (=> mapNonEmpty!47279 (= mapRes!47279 (and tp!89889 e!679177))))

(declare-fun mapRest!47279 () (Array (_ BitVec 32) ValueCell!14438))

(declare-fun mapValue!47279 () ValueCell!14438)

(declare-fun mapKey!47279 () (_ BitVec 32))

(assert (=> mapNonEmpty!47279 (= (arr!37300 _values!996) (store mapRest!47279 mapKey!47279 mapValue!47279))))

(declare-fun b!1195198 () Bool)

(declare-fun res!795307 () Bool)

(declare-fun e!679173 () Bool)

(assert (=> b!1195198 (=> (not res!795307) (not e!679173))))

(declare-fun _keys!1208 () array!77304)

(assert (=> b!1195198 (= res!795307 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26349))))

(declare-fun b!1195199 () Bool)

(declare-fun tp_is_empty!30295 () Bool)

(assert (=> b!1195199 (= e!679177 tp_is_empty!30295)))

(declare-fun mapIsEmpty!47279 () Bool)

(assert (=> mapIsEmpty!47279 mapRes!47279))

(declare-fun b!1195200 () Bool)

(declare-fun res!795309 () Bool)

(assert (=> b!1195200 (=> (not res!795309) (not e!679173))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77304 (_ BitVec 32)) Bool)

(assert (=> b!1195200 (= res!795309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195201 () Bool)

(assert (=> b!1195201 (= e!679172 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77304 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195201 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39501 0))(
  ( (Unit!39502) )
))
(declare-fun lt!542717 () Unit!39501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77304 (_ BitVec 64) (_ BitVec 32)) Unit!39501)

(assert (=> b!1195201 (= lt!542717 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195202 () Bool)

(declare-fun res!795301 () Bool)

(assert (=> b!1195202 (=> (not res!795301) (not e!679173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195202 (= res!795301 (validMask!0 mask!1564))))

(declare-fun res!795303 () Bool)

(assert (=> start!100222 (=> (not res!795303) (not e!679173))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100222 (= res!795303 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37837 _keys!1208))))))

(assert (=> start!100222 e!679173))

(declare-fun array_inv!28552 (array!77304) Bool)

(assert (=> start!100222 (array_inv!28552 _keys!1208)))

(assert (=> start!100222 true))

(declare-fun array_inv!28553 (array!77306) Bool)

(assert (=> start!100222 (and (array_inv!28553 _values!996) e!679174)))

(declare-fun b!1195203 () Bool)

(assert (=> b!1195203 (= e!679176 tp_is_empty!30295)))

(declare-fun b!1195204 () Bool)

(declare-fun res!795310 () Bool)

(assert (=> b!1195204 (=> (not res!795310) (not e!679173))))

(assert (=> b!1195204 (= res!795310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37837 _keys!1208))))))

(declare-fun b!1195205 () Bool)

(declare-fun res!795302 () Bool)

(assert (=> b!1195205 (=> (not res!795302) (not e!679173))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195205 (= res!795302 (and (= (size!37838 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37837 _keys!1208) (size!37838 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195206 () Bool)

(assert (=> b!1195206 (= e!679173 e!679172)))

(declare-fun res!795308 () Bool)

(assert (=> b!1195206 (=> (not res!795308) (not e!679172))))

(assert (=> b!1195206 (= res!795308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542718 mask!1564))))

(assert (=> b!1195206 (= lt!542718 (array!77305 (store (arr!37299 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37837 _keys!1208)))))

(declare-fun b!1195207 () Bool)

(declare-fun res!795304 () Bool)

(assert (=> b!1195207 (=> (not res!795304) (not e!679173))))

(assert (=> b!1195207 (= res!795304 (= (select (arr!37299 _keys!1208) i!673) k0!934))))

(declare-fun b!1195208 () Bool)

(declare-fun res!795306 () Bool)

(assert (=> b!1195208 (=> (not res!795306) (not e!679173))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195208 (= res!795306 (validKeyInArray!0 k0!934))))

(assert (= (and start!100222 res!795303) b!1195202))

(assert (= (and b!1195202 res!795301) b!1195205))

(assert (= (and b!1195205 res!795302) b!1195200))

(assert (= (and b!1195200 res!795309) b!1195198))

(assert (= (and b!1195198 res!795307) b!1195204))

(assert (= (and b!1195204 res!795310) b!1195208))

(assert (= (and b!1195208 res!795306) b!1195207))

(assert (= (and b!1195207 res!795304) b!1195206))

(assert (= (and b!1195206 res!795308) b!1195196))

(assert (= (and b!1195196 res!795305) b!1195201))

(assert (= (and b!1195197 condMapEmpty!47279) mapIsEmpty!47279))

(assert (= (and b!1195197 (not condMapEmpty!47279)) mapNonEmpty!47279))

(get-info :version)

(assert (= (and mapNonEmpty!47279 ((_ is ValueCellFull!14438) mapValue!47279)) b!1195199))

(assert (= (and b!1195197 ((_ is ValueCellFull!14438) mapDefault!47279)) b!1195203))

(assert (= start!100222 b!1195197))

(declare-fun m!1102319 () Bool)

(assert (=> b!1195202 m!1102319))

(declare-fun m!1102321 () Bool)

(assert (=> b!1195207 m!1102321))

(declare-fun m!1102323 () Bool)

(assert (=> start!100222 m!1102323))

(declare-fun m!1102325 () Bool)

(assert (=> start!100222 m!1102325))

(declare-fun m!1102327 () Bool)

(assert (=> b!1195196 m!1102327))

(declare-fun m!1102329 () Bool)

(assert (=> b!1195200 m!1102329))

(declare-fun m!1102331 () Bool)

(assert (=> b!1195198 m!1102331))

(declare-fun m!1102333 () Bool)

(assert (=> b!1195208 m!1102333))

(declare-fun m!1102335 () Bool)

(assert (=> mapNonEmpty!47279 m!1102335))

(declare-fun m!1102337 () Bool)

(assert (=> b!1195206 m!1102337))

(declare-fun m!1102339 () Bool)

(assert (=> b!1195206 m!1102339))

(declare-fun m!1102341 () Bool)

(assert (=> b!1195201 m!1102341))

(declare-fun m!1102343 () Bool)

(assert (=> b!1195201 m!1102343))

(check-sat (not b!1195208) (not start!100222) (not b!1195201) (not mapNonEmpty!47279) (not b!1195206) (not b!1195196) (not b!1195198) (not b!1195200) (not b!1195202) tp_is_empty!30295)
(check-sat)
