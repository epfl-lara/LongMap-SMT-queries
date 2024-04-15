; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100394 () Bool)

(assert start!100394)

(declare-fun b_free!25723 () Bool)

(declare-fun b_next!25723 () Bool)

(assert (=> start!100394 (= b_free!25723 (not b_next!25723))))

(declare-fun tp!90159 () Bool)

(declare-fun b_and!42317 () Bool)

(assert (=> start!100394 (= tp!90159 b_and!42317)))

(declare-fun mapNonEmpty!47483 () Bool)

(declare-fun mapRes!47483 () Bool)

(declare-fun tp!90158 () Bool)

(declare-fun e!680629 () Bool)

(assert (=> mapNonEmpty!47483 (= mapRes!47483 (and tp!90158 e!680629))))

(declare-datatypes ((V!45697 0))(
  ( (V!45698 (val!15270 Int)) )
))
(declare-datatypes ((ValueCell!14504 0))(
  ( (ValueCellFull!14504 (v!17907 V!45697)) (EmptyCell!14504) )
))
(declare-fun mapValue!47483 () ValueCell!14504)

(declare-datatypes ((array!77560 0))(
  ( (array!77561 (arr!37425 (Array (_ BitVec 32) ValueCell!14504)) (size!37963 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77560)

(declare-fun mapKey!47483 () (_ BitVec 32))

(declare-fun mapRest!47483 () (Array (_ BitVec 32) ValueCell!14504))

(assert (=> mapNonEmpty!47483 (= (arr!37425 _values!996) (store mapRest!47483 mapKey!47483 mapValue!47483))))

(declare-fun b!1198190 () Bool)

(declare-fun res!797443 () Bool)

(declare-fun e!680628 () Bool)

(assert (=> b!1198190 (=> (not res!797443) (not e!680628))))

(declare-datatypes ((array!77562 0))(
  ( (array!77563 (arr!37426 (Array (_ BitVec 32) (_ BitVec 64))) (size!37964 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77562)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77562 (_ BitVec 32)) Bool)

(assert (=> b!1198190 (= res!797443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198191 () Bool)

(declare-fun e!680627 () Bool)

(declare-fun e!680631 () Bool)

(assert (=> b!1198191 (= e!680627 (not e!680631))))

(declare-fun res!797449 () Bool)

(assert (=> b!1198191 (=> res!797449 e!680631)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198191 (= res!797449 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198191 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39587 0))(
  ( (Unit!39588) )
))
(declare-fun lt!543275 () Unit!39587)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77562 (_ BitVec 64) (_ BitVec 32)) Unit!39587)

(assert (=> b!1198191 (= lt!543275 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1198192 () Bool)

(declare-fun res!797442 () Bool)

(assert (=> b!1198192 (=> (not res!797442) (not e!680628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198192 (= res!797442 (validKeyInArray!0 k0!934))))

(declare-fun b!1198193 () Bool)

(declare-fun res!797447 () Bool)

(assert (=> b!1198193 (=> (not res!797447) (not e!680628))))

(declare-datatypes ((List!26417 0))(
  ( (Nil!26414) (Cons!26413 (h!27622 (_ BitVec 64)) (t!39115 List!26417)) )
))
(declare-fun arrayNoDuplicates!0 (array!77562 (_ BitVec 32) List!26417) Bool)

(assert (=> b!1198193 (= res!797447 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26414))))

(declare-fun b!1198194 () Bool)

(declare-fun res!797446 () Bool)

(assert (=> b!1198194 (=> (not res!797446) (not e!680628))))

(assert (=> b!1198194 (= res!797446 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37964 _keys!1208))))))

(declare-fun b!1198195 () Bool)

(declare-fun tp_is_empty!30427 () Bool)

(assert (=> b!1198195 (= e!680629 tp_is_empty!30427)))

(declare-fun mapIsEmpty!47483 () Bool)

(assert (=> mapIsEmpty!47483 mapRes!47483))

(declare-fun res!797448 () Bool)

(assert (=> start!100394 (=> (not res!797448) (not e!680628))))

(assert (=> start!100394 (= res!797448 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37964 _keys!1208))))))

(assert (=> start!100394 e!680628))

(assert (=> start!100394 tp_is_empty!30427))

(declare-fun array_inv!28640 (array!77562) Bool)

(assert (=> start!100394 (array_inv!28640 _keys!1208)))

(assert (=> start!100394 true))

(assert (=> start!100394 tp!90159))

(declare-fun e!680626 () Bool)

(declare-fun array_inv!28641 (array!77560) Bool)

(assert (=> start!100394 (and (array_inv!28641 _values!996) e!680626)))

(declare-fun b!1198196 () Bool)

(declare-fun res!797444 () Bool)

(assert (=> b!1198196 (=> (not res!797444) (not e!680628))))

(assert (=> b!1198196 (= res!797444 (= (select (arr!37426 _keys!1208) i!673) k0!934))))

(declare-fun b!1198197 () Bool)

(declare-fun res!797441 () Bool)

(assert (=> b!1198197 (=> (not res!797441) (not e!680627))))

(declare-fun lt!543276 () array!77562)

(assert (=> b!1198197 (= res!797441 (arrayNoDuplicates!0 lt!543276 #b00000000000000000000000000000000 Nil!26414))))

(declare-fun b!1198198 () Bool)

(assert (=> b!1198198 (= e!680631 (bvslt i!673 (size!37963 _values!996)))))

(declare-fun zeroValue!944 () V!45697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45697)

(declare-datatypes ((tuple2!19630 0))(
  ( (tuple2!19631 (_1!9826 (_ BitVec 64)) (_2!9826 V!45697)) )
))
(declare-datatypes ((List!26418 0))(
  ( (Nil!26415) (Cons!26414 (h!27623 tuple2!19630) (t!39116 List!26418)) )
))
(declare-datatypes ((ListLongMap!17599 0))(
  ( (ListLongMap!17600 (toList!8815 List!26418)) )
))
(declare-fun lt!543277 () ListLongMap!17599)

(declare-fun getCurrentListMapNoExtraKeys!5264 (array!77562 array!77560 (_ BitVec 32) (_ BitVec 32) V!45697 V!45697 (_ BitVec 32) Int) ListLongMap!17599)

(assert (=> b!1198198 (= lt!543277 (getCurrentListMapNoExtraKeys!5264 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198199 () Bool)

(declare-fun res!797445 () Bool)

(assert (=> b!1198199 (=> (not res!797445) (not e!680628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198199 (= res!797445 (validMask!0 mask!1564))))

(declare-fun b!1198200 () Bool)

(declare-fun e!680632 () Bool)

(assert (=> b!1198200 (= e!680632 tp_is_empty!30427)))

(declare-fun b!1198201 () Bool)

(declare-fun res!797451 () Bool)

(assert (=> b!1198201 (=> (not res!797451) (not e!680628))))

(assert (=> b!1198201 (= res!797451 (and (= (size!37963 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37964 _keys!1208) (size!37963 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198202 () Bool)

(assert (=> b!1198202 (= e!680628 e!680627)))

(declare-fun res!797450 () Bool)

(assert (=> b!1198202 (=> (not res!797450) (not e!680627))))

(assert (=> b!1198202 (= res!797450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543276 mask!1564))))

(assert (=> b!1198202 (= lt!543276 (array!77563 (store (arr!37426 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37964 _keys!1208)))))

(declare-fun b!1198203 () Bool)

(assert (=> b!1198203 (= e!680626 (and e!680632 mapRes!47483))))

(declare-fun condMapEmpty!47483 () Bool)

(declare-fun mapDefault!47483 () ValueCell!14504)

(assert (=> b!1198203 (= condMapEmpty!47483 (= (arr!37425 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14504)) mapDefault!47483)))))

(assert (= (and start!100394 res!797448) b!1198199))

(assert (= (and b!1198199 res!797445) b!1198201))

(assert (= (and b!1198201 res!797451) b!1198190))

(assert (= (and b!1198190 res!797443) b!1198193))

(assert (= (and b!1198193 res!797447) b!1198194))

(assert (= (and b!1198194 res!797446) b!1198192))

(assert (= (and b!1198192 res!797442) b!1198196))

(assert (= (and b!1198196 res!797444) b!1198202))

(assert (= (and b!1198202 res!797450) b!1198197))

(assert (= (and b!1198197 res!797441) b!1198191))

(assert (= (and b!1198191 (not res!797449)) b!1198198))

(assert (= (and b!1198203 condMapEmpty!47483) mapIsEmpty!47483))

(assert (= (and b!1198203 (not condMapEmpty!47483)) mapNonEmpty!47483))

(get-info :version)

(assert (= (and mapNonEmpty!47483 ((_ is ValueCellFull!14504) mapValue!47483)) b!1198195))

(assert (= (and b!1198203 ((_ is ValueCellFull!14504) mapDefault!47483)) b!1198200))

(assert (= start!100394 b!1198203))

(declare-fun m!1104511 () Bool)

(assert (=> b!1198191 m!1104511))

(declare-fun m!1104513 () Bool)

(assert (=> b!1198191 m!1104513))

(declare-fun m!1104515 () Bool)

(assert (=> b!1198192 m!1104515))

(declare-fun m!1104517 () Bool)

(assert (=> b!1198190 m!1104517))

(declare-fun m!1104519 () Bool)

(assert (=> b!1198197 m!1104519))

(declare-fun m!1104521 () Bool)

(assert (=> b!1198193 m!1104521))

(declare-fun m!1104523 () Bool)

(assert (=> mapNonEmpty!47483 m!1104523))

(declare-fun m!1104525 () Bool)

(assert (=> start!100394 m!1104525))

(declare-fun m!1104527 () Bool)

(assert (=> start!100394 m!1104527))

(declare-fun m!1104529 () Bool)

(assert (=> b!1198202 m!1104529))

(declare-fun m!1104531 () Bool)

(assert (=> b!1198202 m!1104531))

(declare-fun m!1104533 () Bool)

(assert (=> b!1198199 m!1104533))

(declare-fun m!1104535 () Bool)

(assert (=> b!1198198 m!1104535))

(declare-fun m!1104537 () Bool)

(assert (=> b!1198196 m!1104537))

(check-sat (not start!100394) (not b!1198190) tp_is_empty!30427 (not b!1198198) (not b!1198192) (not b!1198197) b_and!42317 (not b!1198193) (not mapNonEmpty!47483) (not b!1198191) (not b!1198202) (not b!1198199) (not b_next!25723))
(check-sat b_and!42317 (not b_next!25723))
