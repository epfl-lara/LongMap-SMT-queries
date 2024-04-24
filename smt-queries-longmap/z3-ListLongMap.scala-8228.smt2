; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100512 () Bool)

(assert start!100512)

(declare-fun b!1197545 () Bool)

(declare-fun e!680519 () Bool)

(declare-fun tp_is_empty!30343 () Bool)

(assert (=> b!1197545 (= e!680519 tp_is_empty!30343)))

(declare-fun b!1197546 () Bool)

(declare-fun e!680516 () Bool)

(assert (=> b!1197546 (= e!680516 tp_is_empty!30343)))

(declare-fun b!1197547 () Bool)

(declare-fun res!796603 () Bool)

(declare-fun e!680514 () Bool)

(assert (=> b!1197547 (=> (not res!796603) (not e!680514))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77505 0))(
  ( (array!77506 (arr!37393 (Array (_ BitVec 32) (_ BitVec 64))) (size!37930 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77505)

(assert (=> b!1197547 (= res!796603 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37930 _keys!1208))))))

(declare-fun b!1197548 () Bool)

(declare-fun res!796600 () Bool)

(declare-fun e!680515 () Bool)

(assert (=> b!1197548 (=> (not res!796600) (not e!680515))))

(declare-fun lt!543538 () array!77505)

(declare-datatypes ((List!26328 0))(
  ( (Nil!26325) (Cons!26324 (h!27542 (_ BitVec 64)) (t!38991 List!26328)) )
))
(declare-fun arrayNoDuplicates!0 (array!77505 (_ BitVec 32) List!26328) Bool)

(assert (=> b!1197548 (= res!796600 (arrayNoDuplicates!0 lt!543538 #b00000000000000000000000000000000 Nil!26325))))

(declare-fun b!1197549 () Bool)

(declare-fun e!680517 () Bool)

(declare-fun mapRes!47351 () Bool)

(assert (=> b!1197549 (= e!680517 (and e!680516 mapRes!47351))))

(declare-fun condMapEmpty!47351 () Bool)

(declare-datatypes ((V!45585 0))(
  ( (V!45586 (val!15228 Int)) )
))
(declare-datatypes ((ValueCell!14462 0))(
  ( (ValueCellFull!14462 (v!17862 V!45585)) (EmptyCell!14462) )
))
(declare-datatypes ((array!77507 0))(
  ( (array!77508 (arr!37394 (Array (_ BitVec 32) ValueCell!14462)) (size!37931 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77507)

(declare-fun mapDefault!47351 () ValueCell!14462)

(assert (=> b!1197549 (= condMapEmpty!47351 (= (arr!37394 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14462)) mapDefault!47351)))))

(declare-fun b!1197550 () Bool)

(assert (=> b!1197550 (= e!680515 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1197550 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39635 0))(
  ( (Unit!39636) )
))
(declare-fun lt!543537 () Unit!39635)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77505 (_ BitVec 64) (_ BitVec 32)) Unit!39635)

(assert (=> b!1197550 (= lt!543537 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1197551 () Bool)

(assert (=> b!1197551 (= e!680514 e!680515)))

(declare-fun res!796598 () Bool)

(assert (=> b!1197551 (=> (not res!796598) (not e!680515))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77505 (_ BitVec 32)) Bool)

(assert (=> b!1197551 (= res!796598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543538 mask!1564))))

(assert (=> b!1197551 (= lt!543538 (array!77506 (store (arr!37393 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37930 _keys!1208)))))

(declare-fun b!1197552 () Bool)

(declare-fun res!796596 () Bool)

(assert (=> b!1197552 (=> (not res!796596) (not e!680514))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1197552 (= res!796596 (and (= (size!37931 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37930 _keys!1208) (size!37931 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1197553 () Bool)

(declare-fun res!796604 () Bool)

(assert (=> b!1197553 (=> (not res!796604) (not e!680514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1197553 (= res!796604 (validKeyInArray!0 k0!934))))

(declare-fun b!1197554 () Bool)

(declare-fun res!796597 () Bool)

(assert (=> b!1197554 (=> (not res!796597) (not e!680514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1197554 (= res!796597 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47351 () Bool)

(declare-fun tp!89961 () Bool)

(assert (=> mapNonEmpty!47351 (= mapRes!47351 (and tp!89961 e!680519))))

(declare-fun mapKey!47351 () (_ BitVec 32))

(declare-fun mapValue!47351 () ValueCell!14462)

(declare-fun mapRest!47351 () (Array (_ BitVec 32) ValueCell!14462))

(assert (=> mapNonEmpty!47351 (= (arr!37394 _values!996) (store mapRest!47351 mapKey!47351 mapValue!47351))))

(declare-fun res!796595 () Bool)

(assert (=> start!100512 (=> (not res!796595) (not e!680514))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100512 (= res!796595 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37930 _keys!1208))))))

(assert (=> start!100512 e!680514))

(declare-fun array_inv!28572 (array!77505) Bool)

(assert (=> start!100512 (array_inv!28572 _keys!1208)))

(assert (=> start!100512 true))

(declare-fun array_inv!28573 (array!77507) Bool)

(assert (=> start!100512 (and (array_inv!28573 _values!996) e!680517)))

(declare-fun b!1197555 () Bool)

(declare-fun res!796601 () Bool)

(assert (=> b!1197555 (=> (not res!796601) (not e!680514))))

(assert (=> b!1197555 (= res!796601 (= (select (arr!37393 _keys!1208) i!673) k0!934))))

(declare-fun b!1197556 () Bool)

(declare-fun res!796602 () Bool)

(assert (=> b!1197556 (=> (not res!796602) (not e!680514))))

(assert (=> b!1197556 (= res!796602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!47351 () Bool)

(assert (=> mapIsEmpty!47351 mapRes!47351))

(declare-fun b!1197557 () Bool)

(declare-fun res!796599 () Bool)

(assert (=> b!1197557 (=> (not res!796599) (not e!680514))))

(assert (=> b!1197557 (= res!796599 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26325))))

(assert (= (and start!100512 res!796595) b!1197554))

(assert (= (and b!1197554 res!796597) b!1197552))

(assert (= (and b!1197552 res!796596) b!1197556))

(assert (= (and b!1197556 res!796602) b!1197557))

(assert (= (and b!1197557 res!796599) b!1197547))

(assert (= (and b!1197547 res!796603) b!1197553))

(assert (= (and b!1197553 res!796604) b!1197555))

(assert (= (and b!1197555 res!796601) b!1197551))

(assert (= (and b!1197551 res!796598) b!1197548))

(assert (= (and b!1197548 res!796600) b!1197550))

(assert (= (and b!1197549 condMapEmpty!47351) mapIsEmpty!47351))

(assert (= (and b!1197549 (not condMapEmpty!47351)) mapNonEmpty!47351))

(get-info :version)

(assert (= (and mapNonEmpty!47351 ((_ is ValueCellFull!14462) mapValue!47351)) b!1197545))

(assert (= (and b!1197549 ((_ is ValueCellFull!14462) mapDefault!47351)) b!1197546))

(assert (= start!100512 b!1197549))

(declare-fun m!1105125 () Bool)

(assert (=> b!1197556 m!1105125))

(declare-fun m!1105127 () Bool)

(assert (=> b!1197554 m!1105127))

(declare-fun m!1105129 () Bool)

(assert (=> b!1197548 m!1105129))

(declare-fun m!1105131 () Bool)

(assert (=> b!1197553 m!1105131))

(declare-fun m!1105133 () Bool)

(assert (=> b!1197551 m!1105133))

(declare-fun m!1105135 () Bool)

(assert (=> b!1197551 m!1105135))

(declare-fun m!1105137 () Bool)

(assert (=> b!1197557 m!1105137))

(declare-fun m!1105139 () Bool)

(assert (=> start!100512 m!1105139))

(declare-fun m!1105141 () Bool)

(assert (=> start!100512 m!1105141))

(declare-fun m!1105143 () Bool)

(assert (=> mapNonEmpty!47351 m!1105143))

(declare-fun m!1105145 () Bool)

(assert (=> b!1197550 m!1105145))

(declare-fun m!1105147 () Bool)

(assert (=> b!1197550 m!1105147))

(declare-fun m!1105149 () Bool)

(assert (=> b!1197555 m!1105149))

(check-sat (not b!1197553) (not b!1197550) tp_is_empty!30343 (not mapNonEmpty!47351) (not b!1197556) (not start!100512) (not b!1197548) (not b!1197554) (not b!1197551) (not b!1197557))
(check-sat)
