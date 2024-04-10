; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99768 () Bool)

(assert start!99768)

(declare-fun b_free!25347 () Bool)

(declare-fun b_next!25347 () Bool)

(assert (=> start!99768 (= b_free!25347 (not b_next!25347))))

(declare-fun tp!88754 () Bool)

(declare-fun b_and!41561 () Bool)

(assert (=> start!99768 (= tp!88754 b_and!41561)))

(declare-fun b!1185043 () Bool)

(declare-fun res!787712 () Bool)

(declare-fun e!673784 () Bool)

(assert (=> b!1185043 (=> (not res!787712) (not e!673784))))

(declare-datatypes ((array!76553 0))(
  ( (array!76554 (arr!36926 (Array (_ BitVec 32) (_ BitVec 64))) (size!37462 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76553)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1185043 (= res!787712 (= (select (arr!36926 _keys!1208) i!673) k0!934))))

(declare-fun b!1185045 () Bool)

(declare-fun res!787716 () Bool)

(assert (=> b!1185045 (=> (not res!787716) (not e!673784))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44963 0))(
  ( (V!44964 (val!14995 Int)) )
))
(declare-datatypes ((ValueCell!14229 0))(
  ( (ValueCellFull!14229 (v!17633 V!44963)) (EmptyCell!14229) )
))
(declare-datatypes ((array!76555 0))(
  ( (array!76556 (arr!36927 (Array (_ BitVec 32) ValueCell!14229)) (size!37463 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76555)

(assert (=> b!1185045 (= res!787716 (and (= (size!37463 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37462 _keys!1208) (size!37463 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185046 () Bool)

(declare-fun e!673786 () Bool)

(declare-fun e!673782 () Bool)

(assert (=> b!1185046 (= e!673786 e!673782)))

(declare-fun res!787721 () Bool)

(assert (=> b!1185046 (=> res!787721 e!673782)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185046 (= res!787721 (not (= (select (arr!36926 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185047 () Bool)

(declare-fun res!787714 () Bool)

(assert (=> b!1185047 (=> (not res!787714) (not e!673784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76553 (_ BitVec 32)) Bool)

(assert (=> b!1185047 (= res!787714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185048 () Bool)

(declare-fun res!787709 () Bool)

(declare-fun e!673777 () Bool)

(assert (=> b!1185048 (=> (not res!787709) (not e!673777))))

(declare-fun lt!537660 () array!76553)

(declare-datatypes ((List!25972 0))(
  ( (Nil!25969) (Cons!25968 (h!27177 (_ BitVec 64)) (t!38311 List!25972)) )
))
(declare-fun arrayNoDuplicates!0 (array!76553 (_ BitVec 32) List!25972) Bool)

(assert (=> b!1185048 (= res!787709 (arrayNoDuplicates!0 lt!537660 #b00000000000000000000000000000000 Nil!25969))))

(declare-fun b!1185049 () Bool)

(declare-fun e!673785 () Bool)

(declare-fun e!673778 () Bool)

(assert (=> b!1185049 (= e!673785 e!673778)))

(declare-fun res!787713 () Bool)

(assert (=> b!1185049 (=> res!787713 e!673778)))

(assert (=> b!1185049 (= res!787713 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44963)

(declare-datatypes ((tuple2!19232 0))(
  ( (tuple2!19233 (_1!9627 (_ BitVec 64)) (_2!9627 V!44963)) )
))
(declare-datatypes ((List!25973 0))(
  ( (Nil!25970) (Cons!25969 (h!27178 tuple2!19232) (t!38312 List!25973)) )
))
(declare-datatypes ((ListLongMap!17201 0))(
  ( (ListLongMap!17202 (toList!8616 List!25973)) )
))
(declare-fun lt!537649 () ListLongMap!17201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537655 () array!76555)

(declare-fun minValue!944 () V!44963)

(declare-fun getCurrentListMapNoExtraKeys!5063 (array!76553 array!76555 (_ BitVec 32) (_ BitVec 32) V!44963 V!44963 (_ BitVec 32) Int) ListLongMap!17201)

(assert (=> b!1185049 (= lt!537649 (getCurrentListMapNoExtraKeys!5063 lt!537660 lt!537655 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!537651 () V!44963)

(assert (=> b!1185049 (= lt!537655 (array!76556 (store (arr!36927 _values!996) i!673 (ValueCellFull!14229 lt!537651)) (size!37463 _values!996)))))

(declare-fun dynLambda!3014 (Int (_ BitVec 64)) V!44963)

(assert (=> b!1185049 (= lt!537651 (dynLambda!3014 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!537656 () ListLongMap!17201)

(assert (=> b!1185049 (= lt!537656 (getCurrentListMapNoExtraKeys!5063 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185050 () Bool)

(declare-fun e!673779 () Bool)

(assert (=> b!1185050 (= e!673778 e!673779)))

(declare-fun res!787719 () Bool)

(assert (=> b!1185050 (=> res!787719 e!673779)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185050 (= res!787719 (not (validKeyInArray!0 (select (arr!36926 _keys!1208) from!1455))))))

(declare-fun lt!537644 () ListLongMap!17201)

(declare-fun lt!537652 () ListLongMap!17201)

(assert (=> b!1185050 (= lt!537644 lt!537652)))

(declare-fun lt!537642 () ListLongMap!17201)

(declare-fun -!1651 (ListLongMap!17201 (_ BitVec 64)) ListLongMap!17201)

(assert (=> b!1185050 (= lt!537652 (-!1651 lt!537642 k0!934))))

(assert (=> b!1185050 (= lt!537644 (getCurrentListMapNoExtraKeys!5063 lt!537660 lt!537655 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185050 (= lt!537642 (getCurrentListMapNoExtraKeys!5063 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39249 0))(
  ( (Unit!39250) )
))
(declare-fun lt!537658 () Unit!39249)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 (array!76553 array!76555 (_ BitVec 32) (_ BitVec 32) V!44963 V!44963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39249)

(assert (=> b!1185050 (= lt!537658 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!787720 () Bool)

(assert (=> start!99768 (=> (not res!787720) (not e!673784))))

(assert (=> start!99768 (= res!787720 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37462 _keys!1208))))))

(assert (=> start!99768 e!673784))

(declare-fun tp_is_empty!29877 () Bool)

(assert (=> start!99768 tp_is_empty!29877))

(declare-fun array_inv!28180 (array!76553) Bool)

(assert (=> start!99768 (array_inv!28180 _keys!1208)))

(assert (=> start!99768 true))

(assert (=> start!99768 tp!88754))

(declare-fun e!673783 () Bool)

(declare-fun array_inv!28181 (array!76555) Bool)

(assert (=> start!99768 (and (array_inv!28181 _values!996) e!673783)))

(declare-fun b!1185044 () Bool)

(declare-fun res!787711 () Bool)

(assert (=> b!1185044 (=> (not res!787711) (not e!673784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185044 (= res!787711 (validMask!0 mask!1564))))

(declare-fun b!1185051 () Bool)

(assert (=> b!1185051 (= e!673777 (not e!673785))))

(declare-fun res!787722 () Bool)

(assert (=> b!1185051 (=> res!787722 e!673785)))

(assert (=> b!1185051 (= res!787722 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185051 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537646 () Unit!39249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76553 (_ BitVec 64) (_ BitVec 32)) Unit!39249)

(assert (=> b!1185051 (= lt!537646 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185052 () Bool)

(declare-fun res!787710 () Bool)

(assert (=> b!1185052 (=> (not res!787710) (not e!673784))))

(assert (=> b!1185052 (= res!787710 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37462 _keys!1208))))))

(declare-fun b!1185053 () Bool)

(declare-fun e!673775 () Unit!39249)

(declare-fun Unit!39251 () Unit!39249)

(assert (=> b!1185053 (= e!673775 Unit!39251)))

(declare-fun lt!537653 () Unit!39249)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76553 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39249)

(assert (=> b!1185053 (= lt!537653 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185053 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537657 () Unit!39249)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76553 (_ BitVec 32) (_ BitVec 32)) Unit!39249)

(assert (=> b!1185053 (= lt!537657 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185053 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25969)))

(declare-fun lt!537645 () Unit!39249)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76553 (_ BitVec 64) (_ BitVec 32) List!25972) Unit!39249)

(assert (=> b!1185053 (= lt!537645 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25969))))

(assert (=> b!1185053 false))

(declare-fun b!1185054 () Bool)

(declare-fun e!673780 () Bool)

(declare-fun mapRes!46643 () Bool)

(assert (=> b!1185054 (= e!673783 (and e!673780 mapRes!46643))))

(declare-fun condMapEmpty!46643 () Bool)

(declare-fun mapDefault!46643 () ValueCell!14229)

(assert (=> b!1185054 (= condMapEmpty!46643 (= (arr!36927 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14229)) mapDefault!46643)))))

(declare-fun b!1185055 () Bool)

(assert (=> b!1185055 (= e!673780 tp_is_empty!29877)))

(declare-fun b!1185056 () Bool)

(assert (=> b!1185056 (= e!673782 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185057 () Bool)

(declare-fun e!673776 () Bool)

(assert (=> b!1185057 (= e!673776 tp_is_empty!29877)))

(declare-fun mapIsEmpty!46643 () Bool)

(assert (=> mapIsEmpty!46643 mapRes!46643))

(declare-fun b!1185058 () Bool)

(declare-fun res!787718 () Bool)

(assert (=> b!1185058 (=> (not res!787718) (not e!673784))))

(assert (=> b!1185058 (= res!787718 (validKeyInArray!0 k0!934))))

(declare-fun b!1185059 () Bool)

(declare-fun Unit!39252 () Unit!39249)

(assert (=> b!1185059 (= e!673775 Unit!39252)))

(declare-fun b!1185060 () Bool)

(assert (=> b!1185060 (= e!673779 true)))

(declare-fun lt!537654 () ListLongMap!17201)

(declare-fun lt!537650 () ListLongMap!17201)

(assert (=> b!1185060 (= (-!1651 lt!537654 k0!934) lt!537650)))

(declare-fun lt!537643 () V!44963)

(declare-fun lt!537647 () Unit!39249)

(declare-fun addRemoveCommutativeForDiffKeys!176 (ListLongMap!17201 (_ BitVec 64) V!44963 (_ BitVec 64)) Unit!39249)

(assert (=> b!1185060 (= lt!537647 (addRemoveCommutativeForDiffKeys!176 lt!537642 (select (arr!36926 _keys!1208) from!1455) lt!537643 k0!934))))

(assert (=> b!1185060 (and (= lt!537656 lt!537654) (= lt!537652 lt!537644))))

(declare-fun lt!537659 () tuple2!19232)

(declare-fun +!3913 (ListLongMap!17201 tuple2!19232) ListLongMap!17201)

(assert (=> b!1185060 (= lt!537654 (+!3913 lt!537642 lt!537659))))

(assert (=> b!1185060 (not (= (select (arr!36926 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537648 () Unit!39249)

(assert (=> b!1185060 (= lt!537648 e!673775)))

(declare-fun c!117144 () Bool)

(assert (=> b!1185060 (= c!117144 (= (select (arr!36926 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185060 e!673786))

(declare-fun res!787723 () Bool)

(assert (=> b!1185060 (=> (not res!787723) (not e!673786))))

(assert (=> b!1185060 (= res!787723 (= lt!537649 lt!537650))))

(assert (=> b!1185060 (= lt!537650 (+!3913 lt!537652 lt!537659))))

(assert (=> b!1185060 (= lt!537659 (tuple2!19233 (select (arr!36926 _keys!1208) from!1455) lt!537643))))

(declare-fun get!18902 (ValueCell!14229 V!44963) V!44963)

(assert (=> b!1185060 (= lt!537643 (get!18902 (select (arr!36927 _values!996) from!1455) lt!537651))))

(declare-fun b!1185061 () Bool)

(assert (=> b!1185061 (= e!673784 e!673777)))

(declare-fun res!787715 () Bool)

(assert (=> b!1185061 (=> (not res!787715) (not e!673777))))

(assert (=> b!1185061 (= res!787715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537660 mask!1564))))

(assert (=> b!1185061 (= lt!537660 (array!76554 (store (arr!36926 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37462 _keys!1208)))))

(declare-fun b!1185062 () Bool)

(declare-fun res!787717 () Bool)

(assert (=> b!1185062 (=> (not res!787717) (not e!673784))))

(assert (=> b!1185062 (= res!787717 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25969))))

(declare-fun mapNonEmpty!46643 () Bool)

(declare-fun tp!88755 () Bool)

(assert (=> mapNonEmpty!46643 (= mapRes!46643 (and tp!88755 e!673776))))

(declare-fun mapValue!46643 () ValueCell!14229)

(declare-fun mapRest!46643 () (Array (_ BitVec 32) ValueCell!14229))

(declare-fun mapKey!46643 () (_ BitVec 32))

(assert (=> mapNonEmpty!46643 (= (arr!36927 _values!996) (store mapRest!46643 mapKey!46643 mapValue!46643))))

(assert (= (and start!99768 res!787720) b!1185044))

(assert (= (and b!1185044 res!787711) b!1185045))

(assert (= (and b!1185045 res!787716) b!1185047))

(assert (= (and b!1185047 res!787714) b!1185062))

(assert (= (and b!1185062 res!787717) b!1185052))

(assert (= (and b!1185052 res!787710) b!1185058))

(assert (= (and b!1185058 res!787718) b!1185043))

(assert (= (and b!1185043 res!787712) b!1185061))

(assert (= (and b!1185061 res!787715) b!1185048))

(assert (= (and b!1185048 res!787709) b!1185051))

(assert (= (and b!1185051 (not res!787722)) b!1185049))

(assert (= (and b!1185049 (not res!787713)) b!1185050))

(assert (= (and b!1185050 (not res!787719)) b!1185060))

(assert (= (and b!1185060 res!787723) b!1185046))

(assert (= (and b!1185046 (not res!787721)) b!1185056))

(assert (= (and b!1185060 c!117144) b!1185053))

(assert (= (and b!1185060 (not c!117144)) b!1185059))

(assert (= (and b!1185054 condMapEmpty!46643) mapIsEmpty!46643))

(assert (= (and b!1185054 (not condMapEmpty!46643)) mapNonEmpty!46643))

(get-info :version)

(assert (= (and mapNonEmpty!46643 ((_ is ValueCellFull!14229) mapValue!46643)) b!1185057))

(assert (= (and b!1185054 ((_ is ValueCellFull!14229) mapDefault!46643)) b!1185055))

(assert (= start!99768 b!1185054))

(declare-fun b_lambda!20491 () Bool)

(assert (=> (not b_lambda!20491) (not b!1185049)))

(declare-fun t!38310 () Bool)

(declare-fun tb!10159 () Bool)

(assert (=> (and start!99768 (= defaultEntry!1004 defaultEntry!1004) t!38310) tb!10159))

(declare-fun result!20885 () Bool)

(assert (=> tb!10159 (= result!20885 tp_is_empty!29877)))

(assert (=> b!1185049 t!38310))

(declare-fun b_and!41563 () Bool)

(assert (= b_and!41561 (and (=> t!38310 result!20885) b_and!41563)))

(declare-fun m!1093405 () Bool)

(assert (=> start!99768 m!1093405))

(declare-fun m!1093407 () Bool)

(assert (=> start!99768 m!1093407))

(declare-fun m!1093409 () Bool)

(assert (=> b!1185048 m!1093409))

(declare-fun m!1093411 () Bool)

(assert (=> b!1185062 m!1093411))

(declare-fun m!1093413 () Bool)

(assert (=> b!1185058 m!1093413))

(declare-fun m!1093415 () Bool)

(assert (=> b!1185047 m!1093415))

(declare-fun m!1093417 () Bool)

(assert (=> b!1185053 m!1093417))

(declare-fun m!1093419 () Bool)

(assert (=> b!1185053 m!1093419))

(declare-fun m!1093421 () Bool)

(assert (=> b!1185053 m!1093421))

(declare-fun m!1093423 () Bool)

(assert (=> b!1185053 m!1093423))

(declare-fun m!1093425 () Bool)

(assert (=> b!1185053 m!1093425))

(declare-fun m!1093427 () Bool)

(assert (=> b!1185056 m!1093427))

(declare-fun m!1093429 () Bool)

(assert (=> b!1185046 m!1093429))

(declare-fun m!1093431 () Bool)

(assert (=> b!1185044 m!1093431))

(declare-fun m!1093433 () Bool)

(assert (=> b!1185049 m!1093433))

(declare-fun m!1093435 () Bool)

(assert (=> b!1185049 m!1093435))

(declare-fun m!1093437 () Bool)

(assert (=> b!1185049 m!1093437))

(declare-fun m!1093439 () Bool)

(assert (=> b!1185049 m!1093439))

(declare-fun m!1093441 () Bool)

(assert (=> b!1185060 m!1093441))

(declare-fun m!1093443 () Bool)

(assert (=> b!1185060 m!1093443))

(assert (=> b!1185060 m!1093429))

(declare-fun m!1093445 () Bool)

(assert (=> b!1185060 m!1093445))

(declare-fun m!1093447 () Bool)

(assert (=> b!1185060 m!1093447))

(declare-fun m!1093449 () Bool)

(assert (=> b!1185060 m!1093449))

(assert (=> b!1185060 m!1093443))

(declare-fun m!1093451 () Bool)

(assert (=> b!1185060 m!1093451))

(assert (=> b!1185060 m!1093429))

(declare-fun m!1093453 () Bool)

(assert (=> b!1185050 m!1093453))

(declare-fun m!1093455 () Bool)

(assert (=> b!1185050 m!1093455))

(declare-fun m!1093457 () Bool)

(assert (=> b!1185050 m!1093457))

(assert (=> b!1185050 m!1093429))

(declare-fun m!1093459 () Bool)

(assert (=> b!1185050 m!1093459))

(declare-fun m!1093461 () Bool)

(assert (=> b!1185050 m!1093461))

(assert (=> b!1185050 m!1093429))

(declare-fun m!1093463 () Bool)

(assert (=> mapNonEmpty!46643 m!1093463))

(declare-fun m!1093465 () Bool)

(assert (=> b!1185061 m!1093465))

(declare-fun m!1093467 () Bool)

(assert (=> b!1185061 m!1093467))

(declare-fun m!1093469 () Bool)

(assert (=> b!1185051 m!1093469))

(declare-fun m!1093471 () Bool)

(assert (=> b!1185051 m!1093471))

(declare-fun m!1093473 () Bool)

(assert (=> b!1185043 m!1093473))

(check-sat (not b!1185061) (not b!1185056) b_and!41563 (not b!1185060) (not b_lambda!20491) tp_is_empty!29877 (not start!99768) (not b!1185058) (not b!1185053) (not b!1185044) (not b_next!25347) (not b!1185048) (not b!1185062) (not b!1185050) (not mapNonEmpty!46643) (not b!1185051) (not b!1185049) (not b!1185047))
(check-sat b_and!41563 (not b_next!25347))
