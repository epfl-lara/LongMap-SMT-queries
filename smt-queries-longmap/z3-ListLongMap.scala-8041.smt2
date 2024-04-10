; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99088 () Bool)

(assert start!99088)

(declare-fun b_free!24693 () Bool)

(declare-fun b_next!24693 () Bool)

(assert (=> start!99088 (= b_free!24693 (not b_next!24693))))

(declare-fun tp!86789 () Bool)

(declare-fun b_and!40235 () Bool)

(assert (=> start!99088 (= tp!86789 b_and!40235)))

(declare-fun b!1165371 () Bool)

(declare-fun res!772885 () Bool)

(declare-fun e!662509 () Bool)

(assert (=> b!1165371 (=> (not res!772885) (not e!662509))))

(declare-datatypes ((array!75277 0))(
  ( (array!75278 (arr!36289 (Array (_ BitVec 32) (_ BitVec 64))) (size!36825 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75277)

(declare-datatypes ((List!25441 0))(
  ( (Nil!25438) (Cons!25437 (h!26646 (_ BitVec 64)) (t!37126 List!25441)) )
))
(declare-fun arrayNoDuplicates!0 (array!75277 (_ BitVec 32) List!25441) Bool)

(assert (=> b!1165371 (= res!772885 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25438))))

(declare-fun b!1165372 () Bool)

(declare-fun e!662508 () Bool)

(declare-fun tp_is_empty!29223 () Bool)

(assert (=> b!1165372 (= e!662508 tp_is_empty!29223)))

(declare-fun b!1165373 () Bool)

(declare-fun e!662505 () Bool)

(declare-fun e!662511 () Bool)

(assert (=> b!1165373 (= e!662505 (not e!662511))))

(declare-fun res!772882 () Bool)

(assert (=> b!1165373 (=> res!772882 e!662511)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165373 (= res!772882 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165373 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38454 0))(
  ( (Unit!38455) )
))
(declare-fun lt!524894 () Unit!38454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75277 (_ BitVec 64) (_ BitVec 32)) Unit!38454)

(assert (=> b!1165373 (= lt!524894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165374 () Bool)

(declare-fun res!772879 () Bool)

(assert (=> b!1165374 (=> (not res!772879) (not e!662509))))

(assert (=> b!1165374 (= res!772879 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36825 _keys!1208))))))

(declare-fun mapIsEmpty!45659 () Bool)

(declare-fun mapRes!45659 () Bool)

(assert (=> mapIsEmpty!45659 mapRes!45659))

(declare-fun b!1165375 () Bool)

(declare-fun e!662510 () Bool)

(assert (=> b!1165375 (= e!662510 tp_is_empty!29223)))

(declare-fun b!1165376 () Bool)

(declare-fun res!772881 () Bool)

(assert (=> b!1165376 (=> (not res!772881) (not e!662509))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44091 0))(
  ( (V!44092 (val!14668 Int)) )
))
(declare-datatypes ((ValueCell!13902 0))(
  ( (ValueCellFull!13902 (v!17305 V!44091)) (EmptyCell!13902) )
))
(declare-datatypes ((array!75279 0))(
  ( (array!75280 (arr!36290 (Array (_ BitVec 32) ValueCell!13902)) (size!36826 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75279)

(assert (=> b!1165376 (= res!772881 (and (= (size!36826 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36825 _keys!1208) (size!36826 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165370 () Bool)

(assert (=> b!1165370 (= e!662509 e!662505)))

(declare-fun res!772886 () Bool)

(assert (=> b!1165370 (=> (not res!772886) (not e!662505))))

(declare-fun lt!524893 () array!75277)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75277 (_ BitVec 32)) Bool)

(assert (=> b!1165370 (= res!772886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524893 mask!1564))))

(assert (=> b!1165370 (= lt!524893 (array!75278 (store (arr!36289 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36825 _keys!1208)))))

(declare-fun res!772883 () Bool)

(assert (=> start!99088 (=> (not res!772883) (not e!662509))))

(assert (=> start!99088 (= res!772883 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36825 _keys!1208))))))

(assert (=> start!99088 e!662509))

(assert (=> start!99088 tp_is_empty!29223))

(declare-fun array_inv!27758 (array!75277) Bool)

(assert (=> start!99088 (array_inv!27758 _keys!1208)))

(assert (=> start!99088 true))

(assert (=> start!99088 tp!86789))

(declare-fun e!662507 () Bool)

(declare-fun array_inv!27759 (array!75279) Bool)

(assert (=> start!99088 (and (array_inv!27759 _values!996) e!662507)))

(declare-fun mapNonEmpty!45659 () Bool)

(declare-fun tp!86790 () Bool)

(assert (=> mapNonEmpty!45659 (= mapRes!45659 (and tp!86790 e!662510))))

(declare-fun mapValue!45659 () ValueCell!13902)

(declare-fun mapRest!45659 () (Array (_ BitVec 32) ValueCell!13902))

(declare-fun mapKey!45659 () (_ BitVec 32))

(assert (=> mapNonEmpty!45659 (= (arr!36290 _values!996) (store mapRest!45659 mapKey!45659 mapValue!45659))))

(declare-fun b!1165377 () Bool)

(declare-fun res!772884 () Bool)

(assert (=> b!1165377 (=> (not res!772884) (not e!662509))))

(assert (=> b!1165377 (= res!772884 (= (select (arr!36289 _keys!1208) i!673) k0!934))))

(declare-fun b!1165378 () Bool)

(assert (=> b!1165378 (= e!662511 true)))

(declare-fun zeroValue!944 () V!44091)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44091)

(declare-datatypes ((tuple2!18706 0))(
  ( (tuple2!18707 (_1!9364 (_ BitVec 64)) (_2!9364 V!44091)) )
))
(declare-datatypes ((List!25442 0))(
  ( (Nil!25439) (Cons!25438 (h!26647 tuple2!18706) (t!37127 List!25442)) )
))
(declare-datatypes ((ListLongMap!16675 0))(
  ( (ListLongMap!16676 (toList!8353 List!25442)) )
))
(declare-fun lt!524892 () ListLongMap!16675)

(declare-fun getCurrentListMapNoExtraKeys!4817 (array!75277 array!75279 (_ BitVec 32) (_ BitVec 32) V!44091 V!44091 (_ BitVec 32) Int) ListLongMap!16675)

(declare-fun dynLambda!2807 (Int (_ BitVec 64)) V!44091)

(assert (=> b!1165378 (= lt!524892 (getCurrentListMapNoExtraKeys!4817 lt!524893 (array!75280 (store (arr!36290 _values!996) i!673 (ValueCellFull!13902 (dynLambda!2807 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36826 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524895 () ListLongMap!16675)

(assert (=> b!1165378 (= lt!524895 (getCurrentListMapNoExtraKeys!4817 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165379 () Bool)

(declare-fun res!772889 () Bool)

(assert (=> b!1165379 (=> (not res!772889) (not e!662509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165379 (= res!772889 (validKeyInArray!0 k0!934))))

(declare-fun b!1165380 () Bool)

(assert (=> b!1165380 (= e!662507 (and e!662508 mapRes!45659))))

(declare-fun condMapEmpty!45659 () Bool)

(declare-fun mapDefault!45659 () ValueCell!13902)

(assert (=> b!1165380 (= condMapEmpty!45659 (= (arr!36290 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13902)) mapDefault!45659)))))

(declare-fun b!1165381 () Bool)

(declare-fun res!772888 () Bool)

(assert (=> b!1165381 (=> (not res!772888) (not e!662509))))

(assert (=> b!1165381 (= res!772888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165382 () Bool)

(declare-fun res!772880 () Bool)

(assert (=> b!1165382 (=> (not res!772880) (not e!662509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165382 (= res!772880 (validMask!0 mask!1564))))

(declare-fun b!1165383 () Bool)

(declare-fun res!772887 () Bool)

(assert (=> b!1165383 (=> (not res!772887) (not e!662505))))

(assert (=> b!1165383 (= res!772887 (arrayNoDuplicates!0 lt!524893 #b00000000000000000000000000000000 Nil!25438))))

(assert (= (and start!99088 res!772883) b!1165382))

(assert (= (and b!1165382 res!772880) b!1165376))

(assert (= (and b!1165376 res!772881) b!1165381))

(assert (= (and b!1165381 res!772888) b!1165371))

(assert (= (and b!1165371 res!772885) b!1165374))

(assert (= (and b!1165374 res!772879) b!1165379))

(assert (= (and b!1165379 res!772889) b!1165377))

(assert (= (and b!1165377 res!772884) b!1165370))

(assert (= (and b!1165370 res!772886) b!1165383))

(assert (= (and b!1165383 res!772887) b!1165373))

(assert (= (and b!1165373 (not res!772882)) b!1165378))

(assert (= (and b!1165380 condMapEmpty!45659) mapIsEmpty!45659))

(assert (= (and b!1165380 (not condMapEmpty!45659)) mapNonEmpty!45659))

(get-info :version)

(assert (= (and mapNonEmpty!45659 ((_ is ValueCellFull!13902) mapValue!45659)) b!1165375))

(assert (= (and b!1165380 ((_ is ValueCellFull!13902) mapDefault!45659)) b!1165372))

(assert (= start!99088 b!1165380))

(declare-fun b_lambda!19799 () Bool)

(assert (=> (not b_lambda!19799) (not b!1165378)))

(declare-fun t!37125 () Bool)

(declare-fun tb!9505 () Bool)

(assert (=> (and start!99088 (= defaultEntry!1004 defaultEntry!1004) t!37125) tb!9505))

(declare-fun result!19575 () Bool)

(assert (=> tb!9505 (= result!19575 tp_is_empty!29223)))

(assert (=> b!1165378 t!37125))

(declare-fun b_and!40237 () Bool)

(assert (= b_and!40235 (and (=> t!37125 result!19575) b_and!40237)))

(declare-fun m!1073583 () Bool)

(assert (=> b!1165383 m!1073583))

(declare-fun m!1073585 () Bool)

(assert (=> b!1165379 m!1073585))

(declare-fun m!1073587 () Bool)

(assert (=> start!99088 m!1073587))

(declare-fun m!1073589 () Bool)

(assert (=> start!99088 m!1073589))

(declare-fun m!1073591 () Bool)

(assert (=> b!1165377 m!1073591))

(declare-fun m!1073593 () Bool)

(assert (=> b!1165381 m!1073593))

(declare-fun m!1073595 () Bool)

(assert (=> b!1165373 m!1073595))

(declare-fun m!1073597 () Bool)

(assert (=> b!1165373 m!1073597))

(declare-fun m!1073599 () Bool)

(assert (=> b!1165378 m!1073599))

(declare-fun m!1073601 () Bool)

(assert (=> b!1165378 m!1073601))

(declare-fun m!1073603 () Bool)

(assert (=> b!1165378 m!1073603))

(declare-fun m!1073605 () Bool)

(assert (=> b!1165378 m!1073605))

(declare-fun m!1073607 () Bool)

(assert (=> b!1165382 m!1073607))

(declare-fun m!1073609 () Bool)

(assert (=> b!1165370 m!1073609))

(declare-fun m!1073611 () Bool)

(assert (=> b!1165370 m!1073611))

(declare-fun m!1073613 () Bool)

(assert (=> mapNonEmpty!45659 m!1073613))

(declare-fun m!1073615 () Bool)

(assert (=> b!1165371 m!1073615))

(check-sat (not b!1165381) (not b!1165379) (not b!1165378) (not start!99088) (not b!1165382) (not b!1165383) (not b!1165373) b_and!40237 (not b_lambda!19799) (not b!1165371) (not mapNonEmpty!45659) tp_is_empty!29223 (not b_next!24693) (not b!1165370))
(check-sat b_and!40237 (not b_next!24693))
