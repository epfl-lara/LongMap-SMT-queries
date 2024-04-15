; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100400 () Bool)

(assert start!100400)

(declare-fun b_free!25729 () Bool)

(declare-fun b_next!25729 () Bool)

(assert (=> start!100400 (= b_free!25729 (not b_next!25729))))

(declare-fun tp!90177 () Bool)

(declare-fun b_and!42323 () Bool)

(assert (=> start!100400 (= tp!90177 b_and!42323)))

(declare-fun b!1198317 () Bool)

(declare-fun res!797547 () Bool)

(declare-fun e!680689 () Bool)

(assert (=> b!1198317 (=> (not res!797547) (not e!680689))))

(declare-datatypes ((array!77572 0))(
  ( (array!77573 (arr!37431 (Array (_ BitVec 32) (_ BitVec 64))) (size!37969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77572)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77572 (_ BitVec 32)) Bool)

(assert (=> b!1198317 (= res!797547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198318 () Bool)

(declare-fun res!797543 () Bool)

(assert (=> b!1198318 (=> (not res!797543) (not e!680689))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198318 (= res!797543 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37969 _keys!1208))))))

(declare-fun b!1198319 () Bool)

(declare-fun res!797549 () Bool)

(assert (=> b!1198319 (=> (not res!797549) (not e!680689))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45705 0))(
  ( (V!45706 (val!15273 Int)) )
))
(declare-datatypes ((ValueCell!14507 0))(
  ( (ValueCellFull!14507 (v!17910 V!45705)) (EmptyCell!14507) )
))
(declare-datatypes ((array!77574 0))(
  ( (array!77575 (arr!37432 (Array (_ BitVec 32) ValueCell!14507)) (size!37970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77574)

(assert (=> b!1198319 (= res!797549 (and (= (size!37970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37969 _keys!1208) (size!37970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198320 () Bool)

(declare-fun e!680695 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198320 (= e!680695 (or (not (= from!1455 i!673)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37969 _keys!1208)))))))

(declare-fun zeroValue!944 () V!45705)

(declare-fun lt!543306 () array!77572)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45705)

(declare-datatypes ((tuple2!19634 0))(
  ( (tuple2!19635 (_1!9828 (_ BitVec 64)) (_2!9828 V!45705)) )
))
(declare-datatypes ((List!26421 0))(
  ( (Nil!26418) (Cons!26417 (h!27626 tuple2!19634) (t!39121 List!26421)) )
))
(declare-datatypes ((ListLongMap!17603 0))(
  ( (ListLongMap!17604 (toList!8817 List!26421)) )
))
(declare-fun lt!543304 () ListLongMap!17603)

(declare-fun getCurrentListMapNoExtraKeys!5266 (array!77572 array!77574 (_ BitVec 32) (_ BitVec 32) V!45705 V!45705 (_ BitVec 32) Int) ListLongMap!17603)

(declare-fun dynLambda!3146 (Int (_ BitVec 64)) V!45705)

(assert (=> b!1198320 (= lt!543304 (getCurrentListMapNoExtraKeys!5266 lt!543306 (array!77575 (store (arr!37432 _values!996) i!673 (ValueCellFull!14507 (dynLambda!3146 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37970 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543307 () ListLongMap!17603)

(assert (=> b!1198320 (= lt!543307 (getCurrentListMapNoExtraKeys!5266 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198321 () Bool)

(declare-fun e!680694 () Bool)

(declare-fun tp_is_empty!30433 () Bool)

(assert (=> b!1198321 (= e!680694 tp_is_empty!30433)))

(declare-fun b!1198322 () Bool)

(declare-fun e!680691 () Bool)

(assert (=> b!1198322 (= e!680691 (not e!680695))))

(declare-fun res!797542 () Bool)

(assert (=> b!1198322 (=> res!797542 e!680695)))

(assert (=> b!1198322 (= res!797542 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198322 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39591 0))(
  ( (Unit!39592) )
))
(declare-fun lt!543305 () Unit!39591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77572 (_ BitVec 64) (_ BitVec 32)) Unit!39591)

(assert (=> b!1198322 (= lt!543305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198323 () Bool)

(assert (=> b!1198323 (= e!680689 e!680691)))

(declare-fun res!797548 () Bool)

(assert (=> b!1198323 (=> (not res!797548) (not e!680691))))

(assert (=> b!1198323 (= res!797548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543306 mask!1564))))

(assert (=> b!1198323 (= lt!543306 (array!77573 (store (arr!37431 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37969 _keys!1208)))))

(declare-fun b!1198324 () Bool)

(declare-fun res!797541 () Bool)

(assert (=> b!1198324 (=> (not res!797541) (not e!680689))))

(assert (=> b!1198324 (= res!797541 (= (select (arr!37431 _keys!1208) i!673) k0!934))))

(declare-fun b!1198325 () Bool)

(declare-fun res!797544 () Bool)

(assert (=> b!1198325 (=> (not res!797544) (not e!680689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198325 (= res!797544 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47492 () Bool)

(declare-fun mapRes!47492 () Bool)

(assert (=> mapIsEmpty!47492 mapRes!47492))

(declare-fun b!1198326 () Bool)

(declare-fun res!797546 () Bool)

(assert (=> b!1198326 (=> (not res!797546) (not e!680691))))

(declare-datatypes ((List!26422 0))(
  ( (Nil!26419) (Cons!26418 (h!27627 (_ BitVec 64)) (t!39122 List!26422)) )
))
(declare-fun arrayNoDuplicates!0 (array!77572 (_ BitVec 32) List!26422) Bool)

(assert (=> b!1198326 (= res!797546 (arrayNoDuplicates!0 lt!543306 #b00000000000000000000000000000000 Nil!26419))))

(declare-fun b!1198327 () Bool)

(declare-fun e!680692 () Bool)

(assert (=> b!1198327 (= e!680692 tp_is_empty!30433)))

(declare-fun b!1198328 () Bool)

(declare-fun res!797545 () Bool)

(assert (=> b!1198328 (=> (not res!797545) (not e!680689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198328 (= res!797545 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!47492 () Bool)

(declare-fun tp!90176 () Bool)

(assert (=> mapNonEmpty!47492 (= mapRes!47492 (and tp!90176 e!680694))))

(declare-fun mapValue!47492 () ValueCell!14507)

(declare-fun mapRest!47492 () (Array (_ BitVec 32) ValueCell!14507))

(declare-fun mapKey!47492 () (_ BitVec 32))

(assert (=> mapNonEmpty!47492 (= (arr!37432 _values!996) (store mapRest!47492 mapKey!47492 mapValue!47492))))

(declare-fun b!1198329 () Bool)

(declare-fun res!797550 () Bool)

(assert (=> b!1198329 (=> (not res!797550) (not e!680689))))

(assert (=> b!1198329 (= res!797550 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26419))))

(declare-fun b!1198316 () Bool)

(declare-fun e!680693 () Bool)

(assert (=> b!1198316 (= e!680693 (and e!680692 mapRes!47492))))

(declare-fun condMapEmpty!47492 () Bool)

(declare-fun mapDefault!47492 () ValueCell!14507)

(assert (=> b!1198316 (= condMapEmpty!47492 (= (arr!37432 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14507)) mapDefault!47492)))))

(declare-fun res!797540 () Bool)

(assert (=> start!100400 (=> (not res!797540) (not e!680689))))

(assert (=> start!100400 (= res!797540 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37969 _keys!1208))))))

(assert (=> start!100400 e!680689))

(assert (=> start!100400 tp_is_empty!30433))

(declare-fun array_inv!28644 (array!77572) Bool)

(assert (=> start!100400 (array_inv!28644 _keys!1208)))

(assert (=> start!100400 true))

(assert (=> start!100400 tp!90177))

(declare-fun array_inv!28645 (array!77574) Bool)

(assert (=> start!100400 (and (array_inv!28645 _values!996) e!680693)))

(assert (= (and start!100400 res!797540) b!1198325))

(assert (= (and b!1198325 res!797544) b!1198319))

(assert (= (and b!1198319 res!797549) b!1198317))

(assert (= (and b!1198317 res!797547) b!1198329))

(assert (= (and b!1198329 res!797550) b!1198318))

(assert (= (and b!1198318 res!797543) b!1198328))

(assert (= (and b!1198328 res!797545) b!1198324))

(assert (= (and b!1198324 res!797541) b!1198323))

(assert (= (and b!1198323 res!797548) b!1198326))

(assert (= (and b!1198326 res!797546) b!1198322))

(assert (= (and b!1198322 (not res!797542)) b!1198320))

(assert (= (and b!1198316 condMapEmpty!47492) mapIsEmpty!47492))

(assert (= (and b!1198316 (not condMapEmpty!47492)) mapNonEmpty!47492))

(get-info :version)

(assert (= (and mapNonEmpty!47492 ((_ is ValueCellFull!14507) mapValue!47492)) b!1198321))

(assert (= (and b!1198316 ((_ is ValueCellFull!14507) mapDefault!47492)) b!1198327))

(assert (= start!100400 b!1198316))

(declare-fun b_lambda!20907 () Bool)

(assert (=> (not b_lambda!20907) (not b!1198320)))

(declare-fun t!39120 () Bool)

(declare-fun tb!10521 () Bool)

(assert (=> (and start!100400 (= defaultEntry!1004 defaultEntry!1004) t!39120) tb!10521))

(declare-fun result!21627 () Bool)

(assert (=> tb!10521 (= result!21627 tp_is_empty!30433)))

(assert (=> b!1198320 t!39120))

(declare-fun b_and!42325 () Bool)

(assert (= b_and!42323 (and (=> t!39120 result!21627) b_and!42325)))

(declare-fun m!1104595 () Bool)

(assert (=> b!1198328 m!1104595))

(declare-fun m!1104597 () Bool)

(assert (=> start!100400 m!1104597))

(declare-fun m!1104599 () Bool)

(assert (=> start!100400 m!1104599))

(declare-fun m!1104601 () Bool)

(assert (=> b!1198322 m!1104601))

(declare-fun m!1104603 () Bool)

(assert (=> b!1198322 m!1104603))

(declare-fun m!1104605 () Bool)

(assert (=> b!1198324 m!1104605))

(declare-fun m!1104607 () Bool)

(assert (=> b!1198317 m!1104607))

(declare-fun m!1104609 () Bool)

(assert (=> b!1198320 m!1104609))

(declare-fun m!1104611 () Bool)

(assert (=> b!1198320 m!1104611))

(declare-fun m!1104613 () Bool)

(assert (=> b!1198320 m!1104613))

(declare-fun m!1104615 () Bool)

(assert (=> b!1198320 m!1104615))

(declare-fun m!1104617 () Bool)

(assert (=> b!1198325 m!1104617))

(declare-fun m!1104619 () Bool)

(assert (=> b!1198329 m!1104619))

(declare-fun m!1104621 () Bool)

(assert (=> b!1198323 m!1104621))

(declare-fun m!1104623 () Bool)

(assert (=> b!1198323 m!1104623))

(declare-fun m!1104625 () Bool)

(assert (=> mapNonEmpty!47492 m!1104625))

(declare-fun m!1104627 () Bool)

(assert (=> b!1198326 m!1104627))

(check-sat (not b_next!25729) (not b!1198322) (not b!1198320) (not start!100400) (not b_lambda!20907) (not b!1198326) tp_is_empty!30433 (not mapNonEmpty!47492) (not b!1198325) (not b!1198328) (not b!1198323) b_and!42325 (not b!1198317) (not b!1198329))
(check-sat b_and!42325 (not b_next!25729))
