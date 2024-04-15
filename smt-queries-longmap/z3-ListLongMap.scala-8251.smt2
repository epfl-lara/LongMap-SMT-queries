; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100448 () Bool)

(assert start!100448)

(declare-fun b_free!25777 () Bool)

(declare-fun b_next!25777 () Bool)

(assert (=> start!100448 (= b_free!25777 (not b_next!25777))))

(declare-fun tp!90320 () Bool)

(declare-fun b_and!42419 () Bool)

(assert (=> start!100448 (= tp!90320 b_and!42419)))

(declare-fun b!1199372 () Bool)

(declare-fun e!681196 () Bool)

(assert (=> b!1199372 (= e!681196 true)))

(declare-datatypes ((V!45769 0))(
  ( (V!45770 (val!15297 Int)) )
))
(declare-fun zeroValue!944 () V!45769)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19674 0))(
  ( (tuple2!19675 (_1!9848 (_ BitVec 64)) (_2!9848 V!45769)) )
))
(declare-datatypes ((List!26461 0))(
  ( (Nil!26458) (Cons!26457 (h!27666 tuple2!19674) (t!39209 List!26461)) )
))
(declare-datatypes ((ListLongMap!17643 0))(
  ( (ListLongMap!17644 (toList!8837 List!26461)) )
))
(declare-fun lt!543594 () ListLongMap!17643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77666 0))(
  ( (array!77667 (arr!37478 (Array (_ BitVec 32) (_ BitVec 64))) (size!38016 (_ BitVec 32))) )
))
(declare-fun lt!543592 () array!77666)

(declare-datatypes ((ValueCell!14531 0))(
  ( (ValueCellFull!14531 (v!17934 V!45769)) (EmptyCell!14531) )
))
(declare-datatypes ((array!77668 0))(
  ( (array!77669 (arr!37479 (Array (_ BitVec 32) ValueCell!14531)) (size!38017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77668)

(declare-fun minValue!944 () V!45769)

(declare-fun getCurrentListMapNoExtraKeys!5286 (array!77666 array!77668 (_ BitVec 32) (_ BitVec 32) V!45769 V!45769 (_ BitVec 32) Int) ListLongMap!17643)

(declare-fun dynLambda!3166 (Int (_ BitVec 64)) V!45769)

(assert (=> b!1199372 (= lt!543594 (getCurrentListMapNoExtraKeys!5286 lt!543592 (array!77669 (store (arr!37479 _values!996) i!673 (ValueCellFull!14531 (dynLambda!3166 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38017 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543593 () ListLongMap!17643)

(declare-fun _keys!1208 () array!77666)

(assert (=> b!1199372 (= lt!543593 (getCurrentListMapNoExtraKeys!5286 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199374 () Bool)

(declare-fun res!798338 () Bool)

(declare-fun e!681197 () Bool)

(assert (=> b!1199374 (=> (not res!798338) (not e!681197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199374 (= res!798338 (validMask!0 mask!1564))))

(declare-fun b!1199375 () Bool)

(declare-fun res!798337 () Bool)

(assert (=> b!1199375 (=> (not res!798337) (not e!681197))))

(declare-datatypes ((List!26462 0))(
  ( (Nil!26459) (Cons!26458 (h!27667 (_ BitVec 64)) (t!39210 List!26462)) )
))
(declare-fun arrayNoDuplicates!0 (array!77666 (_ BitVec 32) List!26462) Bool)

(assert (=> b!1199375 (= res!798337 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26459))))

(declare-fun b!1199376 () Bool)

(declare-fun e!681193 () Bool)

(declare-fun tp_is_empty!30481 () Bool)

(assert (=> b!1199376 (= e!681193 tp_is_empty!30481)))

(declare-fun b!1199377 () Bool)

(declare-fun res!798333 () Bool)

(assert (=> b!1199377 (=> (not res!798333) (not e!681197))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199377 (= res!798333 (validKeyInArray!0 k0!934))))

(declare-fun b!1199378 () Bool)

(declare-fun res!798339 () Bool)

(assert (=> b!1199378 (=> (not res!798339) (not e!681197))))

(assert (=> b!1199378 (= res!798339 (and (= (size!38017 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38016 _keys!1208) (size!38017 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199379 () Bool)

(declare-fun e!681198 () Bool)

(declare-fun e!681199 () Bool)

(declare-fun mapRes!47564 () Bool)

(assert (=> b!1199379 (= e!681198 (and e!681199 mapRes!47564))))

(declare-fun condMapEmpty!47564 () Bool)

(declare-fun mapDefault!47564 () ValueCell!14531)

(assert (=> b!1199379 (= condMapEmpty!47564 (= (arr!37479 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14531)) mapDefault!47564)))))

(declare-fun b!1199380 () Bool)

(declare-fun res!798341 () Bool)

(declare-fun e!681195 () Bool)

(assert (=> b!1199380 (=> (not res!798341) (not e!681195))))

(assert (=> b!1199380 (= res!798341 (arrayNoDuplicates!0 lt!543592 #b00000000000000000000000000000000 Nil!26459))))

(declare-fun b!1199381 () Bool)

(declare-fun res!798340 () Bool)

(assert (=> b!1199381 (=> (not res!798340) (not e!681197))))

(assert (=> b!1199381 (= res!798340 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38016 _keys!1208))))))

(declare-fun res!798335 () Bool)

(assert (=> start!100448 (=> (not res!798335) (not e!681197))))

(assert (=> start!100448 (= res!798335 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38016 _keys!1208))))))

(assert (=> start!100448 e!681197))

(assert (=> start!100448 tp_is_empty!30481))

(declare-fun array_inv!28680 (array!77666) Bool)

(assert (=> start!100448 (array_inv!28680 _keys!1208)))

(assert (=> start!100448 true))

(assert (=> start!100448 tp!90320))

(declare-fun array_inv!28681 (array!77668) Bool)

(assert (=> start!100448 (and (array_inv!28681 _values!996) e!681198)))

(declare-fun b!1199373 () Bool)

(assert (=> b!1199373 (= e!681199 tp_is_empty!30481)))

(declare-fun b!1199382 () Bool)

(declare-fun res!798342 () Bool)

(assert (=> b!1199382 (=> (not res!798342) (not e!681197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77666 (_ BitVec 32)) Bool)

(assert (=> b!1199382 (= res!798342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199383 () Bool)

(declare-fun res!798336 () Bool)

(assert (=> b!1199383 (=> (not res!798336) (not e!681197))))

(assert (=> b!1199383 (= res!798336 (= (select (arr!37478 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47564 () Bool)

(assert (=> mapIsEmpty!47564 mapRes!47564))

(declare-fun mapNonEmpty!47564 () Bool)

(declare-fun tp!90321 () Bool)

(assert (=> mapNonEmpty!47564 (= mapRes!47564 (and tp!90321 e!681193))))

(declare-fun mapKey!47564 () (_ BitVec 32))

(declare-fun mapValue!47564 () ValueCell!14531)

(declare-fun mapRest!47564 () (Array (_ BitVec 32) ValueCell!14531))

(assert (=> mapNonEmpty!47564 (= (arr!37479 _values!996) (store mapRest!47564 mapKey!47564 mapValue!47564))))

(declare-fun b!1199384 () Bool)

(assert (=> b!1199384 (= e!681197 e!681195)))

(declare-fun res!798334 () Bool)

(assert (=> b!1199384 (=> (not res!798334) (not e!681195))))

(assert (=> b!1199384 (= res!798334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543592 mask!1564))))

(assert (=> b!1199384 (= lt!543592 (array!77667 (store (arr!37478 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38016 _keys!1208)))))

(declare-fun b!1199385 () Bool)

(assert (=> b!1199385 (= e!681195 (not e!681196))))

(declare-fun res!798332 () Bool)

(assert (=> b!1199385 (=> res!798332 e!681196)))

(assert (=> b!1199385 (= res!798332 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199385 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39629 0))(
  ( (Unit!39630) )
))
(declare-fun lt!543595 () Unit!39629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77666 (_ BitVec 64) (_ BitVec 32)) Unit!39629)

(assert (=> b!1199385 (= lt!543595 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100448 res!798335) b!1199374))

(assert (= (and b!1199374 res!798338) b!1199378))

(assert (= (and b!1199378 res!798339) b!1199382))

(assert (= (and b!1199382 res!798342) b!1199375))

(assert (= (and b!1199375 res!798337) b!1199381))

(assert (= (and b!1199381 res!798340) b!1199377))

(assert (= (and b!1199377 res!798333) b!1199383))

(assert (= (and b!1199383 res!798336) b!1199384))

(assert (= (and b!1199384 res!798334) b!1199380))

(assert (= (and b!1199380 res!798341) b!1199385))

(assert (= (and b!1199385 (not res!798332)) b!1199372))

(assert (= (and b!1199379 condMapEmpty!47564) mapIsEmpty!47564))

(assert (= (and b!1199379 (not condMapEmpty!47564)) mapNonEmpty!47564))

(get-info :version)

(assert (= (and mapNonEmpty!47564 ((_ is ValueCellFull!14531) mapValue!47564)) b!1199376))

(assert (= (and b!1199379 ((_ is ValueCellFull!14531) mapDefault!47564)) b!1199373))

(assert (= start!100448 b!1199379))

(declare-fun b_lambda!20955 () Bool)

(assert (=> (not b_lambda!20955) (not b!1199372)))

(declare-fun t!39208 () Bool)

(declare-fun tb!10569 () Bool)

(assert (=> (and start!100448 (= defaultEntry!1004 defaultEntry!1004) t!39208) tb!10569))

(declare-fun result!21723 () Bool)

(assert (=> tb!10569 (= result!21723 tp_is_empty!30481)))

(assert (=> b!1199372 t!39208))

(declare-fun b_and!42421 () Bool)

(assert (= b_and!42419 (and (=> t!39208 result!21723) b_and!42421)))

(declare-fun m!1105411 () Bool)

(assert (=> b!1199375 m!1105411))

(declare-fun m!1105413 () Bool)

(assert (=> b!1199382 m!1105413))

(declare-fun m!1105415 () Bool)

(assert (=> b!1199384 m!1105415))

(declare-fun m!1105417 () Bool)

(assert (=> b!1199384 m!1105417))

(declare-fun m!1105419 () Bool)

(assert (=> b!1199383 m!1105419))

(declare-fun m!1105421 () Bool)

(assert (=> b!1199380 m!1105421))

(declare-fun m!1105423 () Bool)

(assert (=> b!1199372 m!1105423))

(declare-fun m!1105425 () Bool)

(assert (=> b!1199372 m!1105425))

(declare-fun m!1105427 () Bool)

(assert (=> b!1199372 m!1105427))

(declare-fun m!1105429 () Bool)

(assert (=> b!1199372 m!1105429))

(declare-fun m!1105431 () Bool)

(assert (=> b!1199385 m!1105431))

(declare-fun m!1105433 () Bool)

(assert (=> b!1199385 m!1105433))

(declare-fun m!1105435 () Bool)

(assert (=> b!1199377 m!1105435))

(declare-fun m!1105437 () Bool)

(assert (=> b!1199374 m!1105437))

(declare-fun m!1105439 () Bool)

(assert (=> start!100448 m!1105439))

(declare-fun m!1105441 () Bool)

(assert (=> start!100448 m!1105441))

(declare-fun m!1105443 () Bool)

(assert (=> mapNonEmpty!47564 m!1105443))

(check-sat (not b!1199384) (not b_lambda!20955) (not mapNonEmpty!47564) (not b_next!25777) tp_is_empty!30481 (not b!1199385) (not b!1199375) (not b!1199374) (not b!1199380) (not b!1199377) (not b!1199372) b_and!42421 (not start!100448) (not b!1199382))
(check-sat b_and!42421 (not b_next!25777))
