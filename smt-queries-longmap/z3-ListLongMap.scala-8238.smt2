; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100594 () Bool)

(assert start!100594)

(declare-fun b!1199011 () Bool)

(declare-fun res!797593 () Bool)

(declare-fun e!681237 () Bool)

(assert (=> b!1199011 (=> (not res!797593) (not e!681237))))

(declare-datatypes ((array!77621 0))(
  ( (array!77622 (arr!37450 (Array (_ BitVec 32) (_ BitVec 64))) (size!37987 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77621)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45665 0))(
  ( (V!45666 (val!15258 Int)) )
))
(declare-datatypes ((ValueCell!14492 0))(
  ( (ValueCellFull!14492 (v!17892 V!45665)) (EmptyCell!14492) )
))
(declare-datatypes ((array!77623 0))(
  ( (array!77624 (arr!37451 (Array (_ BitVec 32) ValueCell!14492)) (size!37988 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77623)

(assert (=> b!1199011 (= res!797593 (and (= (size!37988 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37987 _keys!1208) (size!37988 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199012 () Bool)

(declare-fun e!681232 () Bool)

(declare-fun tp_is_empty!30403 () Bool)

(assert (=> b!1199012 (= e!681232 tp_is_empty!30403)))

(declare-fun mapIsEmpty!47444 () Bool)

(declare-fun mapRes!47444 () Bool)

(assert (=> mapIsEmpty!47444 mapRes!47444))

(declare-fun b!1199013 () Bool)

(declare-fun res!797602 () Bool)

(assert (=> b!1199013 (=> (not res!797602) (not e!681237))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199013 (= res!797602 (= (select (arr!37450 _keys!1208) i!673) k0!934))))

(declare-fun b!1199014 () Bool)

(declare-fun res!797594 () Bool)

(declare-fun e!681236 () Bool)

(assert (=> b!1199014 (=> (not res!797594) (not e!681236))))

(declare-fun lt!543825 () array!77621)

(declare-datatypes ((List!26361 0))(
  ( (Nil!26358) (Cons!26357 (h!27575 (_ BitVec 64)) (t!39054 List!26361)) )
))
(declare-fun arrayNoDuplicates!0 (array!77621 (_ BitVec 32) List!26361) Bool)

(assert (=> b!1199014 (= res!797594 (arrayNoDuplicates!0 lt!543825 #b00000000000000000000000000000000 Nil!26358))))

(declare-fun b!1199015 () Bool)

(assert (=> b!1199015 (= e!681237 e!681236)))

(declare-fun res!797598 () Bool)

(assert (=> b!1199015 (=> (not res!797598) (not e!681236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77621 (_ BitVec 32)) Bool)

(assert (=> b!1199015 (= res!797598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543825 mask!1564))))

(assert (=> b!1199015 (= lt!543825 (array!77622 (store (arr!37450 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37987 _keys!1208)))))

(declare-fun b!1199016 () Bool)

(declare-fun res!797595 () Bool)

(assert (=> b!1199016 (=> (not res!797595) (not e!681237))))

(assert (=> b!1199016 (= res!797595 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26358))))

(declare-fun mapNonEmpty!47444 () Bool)

(declare-fun tp!90099 () Bool)

(assert (=> mapNonEmpty!47444 (= mapRes!47444 (and tp!90099 e!681232))))

(declare-fun mapValue!47444 () ValueCell!14492)

(declare-fun mapKey!47444 () (_ BitVec 32))

(declare-fun mapRest!47444 () (Array (_ BitVec 32) ValueCell!14492))

(assert (=> mapNonEmpty!47444 (= (arr!37451 _values!996) (store mapRest!47444 mapKey!47444 mapValue!47444))))

(declare-fun b!1199017 () Bool)

(declare-fun res!797596 () Bool)

(assert (=> b!1199017 (=> (not res!797596) (not e!681237))))

(assert (=> b!1199017 (= res!797596 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37987 _keys!1208))))))

(declare-fun b!1199018 () Bool)

(assert (=> b!1199018 (= e!681236 (not true))))

(declare-fun arrayContainsKey!0 (array!77621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199018 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39681 0))(
  ( (Unit!39682) )
))
(declare-fun lt!543826 () Unit!39681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77621 (_ BitVec 64) (_ BitVec 32)) Unit!39681)

(assert (=> b!1199018 (= lt!543826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199019 () Bool)

(declare-fun res!797599 () Bool)

(assert (=> b!1199019 (=> (not res!797599) (not e!681237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199019 (= res!797599 (validMask!0 mask!1564))))

(declare-fun b!1199021 () Bool)

(declare-fun e!681233 () Bool)

(assert (=> b!1199021 (= e!681233 tp_is_empty!30403)))

(declare-fun b!1199022 () Bool)

(declare-fun e!681234 () Bool)

(assert (=> b!1199022 (= e!681234 (and e!681233 mapRes!47444))))

(declare-fun condMapEmpty!47444 () Bool)

(declare-fun mapDefault!47444 () ValueCell!14492)

(assert (=> b!1199022 (= condMapEmpty!47444 (= (arr!37451 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14492)) mapDefault!47444)))))

(declare-fun b!1199023 () Bool)

(declare-fun res!797600 () Bool)

(assert (=> b!1199023 (=> (not res!797600) (not e!681237))))

(assert (=> b!1199023 (= res!797600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!797601 () Bool)

(assert (=> start!100594 (=> (not res!797601) (not e!681237))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100594 (= res!797601 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37987 _keys!1208))))))

(assert (=> start!100594 e!681237))

(declare-fun array_inv!28612 (array!77621) Bool)

(assert (=> start!100594 (array_inv!28612 _keys!1208)))

(assert (=> start!100594 true))

(declare-fun array_inv!28613 (array!77623) Bool)

(assert (=> start!100594 (and (array_inv!28613 _values!996) e!681234)))

(declare-fun b!1199020 () Bool)

(declare-fun res!797597 () Bool)

(assert (=> b!1199020 (=> (not res!797597) (not e!681237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199020 (= res!797597 (validKeyInArray!0 k0!934))))

(assert (= (and start!100594 res!797601) b!1199019))

(assert (= (and b!1199019 res!797599) b!1199011))

(assert (= (and b!1199011 res!797593) b!1199023))

(assert (= (and b!1199023 res!797600) b!1199016))

(assert (= (and b!1199016 res!797595) b!1199017))

(assert (= (and b!1199017 res!797596) b!1199020))

(assert (= (and b!1199020 res!797597) b!1199013))

(assert (= (and b!1199013 res!797602) b!1199015))

(assert (= (and b!1199015 res!797598) b!1199014))

(assert (= (and b!1199014 res!797594) b!1199018))

(assert (= (and b!1199022 condMapEmpty!47444) mapIsEmpty!47444))

(assert (= (and b!1199022 (not condMapEmpty!47444)) mapNonEmpty!47444))

(get-info :version)

(assert (= (and mapNonEmpty!47444 ((_ is ValueCellFull!14492) mapValue!47444)) b!1199012))

(assert (= (and b!1199022 ((_ is ValueCellFull!14492) mapDefault!47444)) b!1199021))

(assert (= start!100594 b!1199022))

(declare-fun m!1106257 () Bool)

(assert (=> b!1199013 m!1106257))

(declare-fun m!1106259 () Bool)

(assert (=> b!1199019 m!1106259))

(declare-fun m!1106261 () Bool)

(assert (=> b!1199020 m!1106261))

(declare-fun m!1106263 () Bool)

(assert (=> b!1199018 m!1106263))

(declare-fun m!1106265 () Bool)

(assert (=> b!1199018 m!1106265))

(declare-fun m!1106267 () Bool)

(assert (=> mapNonEmpty!47444 m!1106267))

(declare-fun m!1106269 () Bool)

(assert (=> b!1199015 m!1106269))

(declare-fun m!1106271 () Bool)

(assert (=> b!1199015 m!1106271))

(declare-fun m!1106273 () Bool)

(assert (=> b!1199016 m!1106273))

(declare-fun m!1106275 () Bool)

(assert (=> b!1199014 m!1106275))

(declare-fun m!1106277 () Bool)

(assert (=> b!1199023 m!1106277))

(declare-fun m!1106279 () Bool)

(assert (=> start!100594 m!1106279))

(declare-fun m!1106281 () Bool)

(assert (=> start!100594 m!1106281))

(check-sat (not start!100594) (not b!1199016) (not b!1199014) (not b!1199019) (not b!1199015) (not b!1199020) (not b!1199023) (not b!1199018) tp_is_empty!30403 (not mapNonEmpty!47444))
(check-sat)
