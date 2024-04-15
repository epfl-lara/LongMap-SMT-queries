; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100246 () Bool)

(assert start!100246)

(declare-fun b!1195664 () Bool)

(declare-fun e!679390 () Bool)

(declare-fun tp_is_empty!30319 () Bool)

(assert (=> b!1195664 (= e!679390 tp_is_empty!30319)))

(declare-fun res!795669 () Bool)

(declare-fun e!679388 () Bool)

(assert (=> start!100246 (=> (not res!795669) (not e!679388))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77350 0))(
  ( (array!77351 (arr!37322 (Array (_ BitVec 32) (_ BitVec 64))) (size!37860 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77350)

(assert (=> start!100246 (= res!795669 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37860 _keys!1208))))))

(assert (=> start!100246 e!679388))

(declare-fun array_inv!28570 (array!77350) Bool)

(assert (=> start!100246 (array_inv!28570 _keys!1208)))

(assert (=> start!100246 true))

(declare-datatypes ((V!45553 0))(
  ( (V!45554 (val!15216 Int)) )
))
(declare-datatypes ((ValueCell!14450 0))(
  ( (ValueCellFull!14450 (v!17853 V!45553)) (EmptyCell!14450) )
))
(declare-datatypes ((array!77352 0))(
  ( (array!77353 (arr!37323 (Array (_ BitVec 32) ValueCell!14450)) (size!37861 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77352)

(declare-fun e!679392 () Bool)

(declare-fun array_inv!28571 (array!77352) Bool)

(assert (=> start!100246 (and (array_inv!28571 _values!996) e!679392)))

(declare-fun mapIsEmpty!47315 () Bool)

(declare-fun mapRes!47315 () Bool)

(assert (=> mapIsEmpty!47315 mapRes!47315))

(declare-fun b!1195665 () Bool)

(declare-fun res!795662 () Bool)

(assert (=> b!1195665 (=> (not res!795662) (not e!679388))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77350 (_ BitVec 32)) Bool)

(assert (=> b!1195665 (= res!795662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195666 () Bool)

(declare-fun res!795665 () Bool)

(assert (=> b!1195666 (=> (not res!795665) (not e!679388))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195666 (= res!795665 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37860 _keys!1208))))))

(declare-fun b!1195667 () Bool)

(declare-fun res!795666 () Bool)

(assert (=> b!1195667 (=> (not res!795666) (not e!679388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195667 (= res!795666 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47315 () Bool)

(declare-fun tp!89925 () Bool)

(assert (=> mapNonEmpty!47315 (= mapRes!47315 (and tp!89925 e!679390))))

(declare-fun mapRest!47315 () (Array (_ BitVec 32) ValueCell!14450))

(declare-fun mapValue!47315 () ValueCell!14450)

(declare-fun mapKey!47315 () (_ BitVec 32))

(assert (=> mapNonEmpty!47315 (= (arr!37323 _values!996) (store mapRest!47315 mapKey!47315 mapValue!47315))))

(declare-fun b!1195668 () Bool)

(declare-fun e!679389 () Bool)

(assert (=> b!1195668 (= e!679388 e!679389)))

(declare-fun res!795661 () Bool)

(assert (=> b!1195668 (=> (not res!795661) (not e!679389))))

(declare-fun lt!542790 () array!77350)

(assert (=> b!1195668 (= res!795661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542790 mask!1564))))

(assert (=> b!1195668 (= lt!542790 (array!77351 (store (arr!37322 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37860 _keys!1208)))))

(declare-fun b!1195669 () Bool)

(declare-fun res!795667 () Bool)

(assert (=> b!1195669 (=> (not res!795667) (not e!679388))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195669 (= res!795667 (and (= (size!37861 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37860 _keys!1208) (size!37861 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195670 () Bool)

(declare-fun e!679393 () Bool)

(assert (=> b!1195670 (= e!679392 (and e!679393 mapRes!47315))))

(declare-fun condMapEmpty!47315 () Bool)

(declare-fun mapDefault!47315 () ValueCell!14450)

(assert (=> b!1195670 (= condMapEmpty!47315 (= (arr!37323 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14450)) mapDefault!47315)))))

(declare-fun b!1195671 () Bool)

(declare-fun res!795663 () Bool)

(assert (=> b!1195671 (=> (not res!795663) (not e!679389))))

(declare-datatypes ((List!26362 0))(
  ( (Nil!26359) (Cons!26358 (h!27567 (_ BitVec 64)) (t!39024 List!26362)) )
))
(declare-fun arrayNoDuplicates!0 (array!77350 (_ BitVec 32) List!26362) Bool)

(assert (=> b!1195671 (= res!795663 (arrayNoDuplicates!0 lt!542790 #b00000000000000000000000000000000 Nil!26359))))

(declare-fun b!1195672 () Bool)

(declare-fun res!795670 () Bool)

(assert (=> b!1195672 (=> (not res!795670) (not e!679388))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195672 (= res!795670 (validKeyInArray!0 k0!934))))

(declare-fun b!1195673 () Bool)

(declare-fun res!795664 () Bool)

(assert (=> b!1195673 (=> (not res!795664) (not e!679388))))

(assert (=> b!1195673 (= res!795664 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26359))))

(declare-fun b!1195674 () Bool)

(declare-fun res!795668 () Bool)

(assert (=> b!1195674 (=> (not res!795668) (not e!679388))))

(assert (=> b!1195674 (= res!795668 (= (select (arr!37322 _keys!1208) i!673) k0!934))))

(declare-fun b!1195675 () Bool)

(assert (=> b!1195675 (= e!679389 (not true))))

(declare-fun arrayContainsKey!0 (array!77350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195675 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39517 0))(
  ( (Unit!39518) )
))
(declare-fun lt!542789 () Unit!39517)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77350 (_ BitVec 64) (_ BitVec 32)) Unit!39517)

(assert (=> b!1195675 (= lt!542789 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1195676 () Bool)

(assert (=> b!1195676 (= e!679393 tp_is_empty!30319)))

(assert (= (and start!100246 res!795669) b!1195667))

(assert (= (and b!1195667 res!795666) b!1195669))

(assert (= (and b!1195669 res!795667) b!1195665))

(assert (= (and b!1195665 res!795662) b!1195673))

(assert (= (and b!1195673 res!795664) b!1195666))

(assert (= (and b!1195666 res!795665) b!1195672))

(assert (= (and b!1195672 res!795670) b!1195674))

(assert (= (and b!1195674 res!795668) b!1195668))

(assert (= (and b!1195668 res!795661) b!1195671))

(assert (= (and b!1195671 res!795663) b!1195675))

(assert (= (and b!1195670 condMapEmpty!47315) mapIsEmpty!47315))

(assert (= (and b!1195670 (not condMapEmpty!47315)) mapNonEmpty!47315))

(get-info :version)

(assert (= (and mapNonEmpty!47315 ((_ is ValueCellFull!14450) mapValue!47315)) b!1195664))

(assert (= (and b!1195670 ((_ is ValueCellFull!14450) mapDefault!47315)) b!1195676))

(assert (= start!100246 b!1195670))

(declare-fun m!1102631 () Bool)

(assert (=> b!1195674 m!1102631))

(declare-fun m!1102633 () Bool)

(assert (=> mapNonEmpty!47315 m!1102633))

(declare-fun m!1102635 () Bool)

(assert (=> b!1195671 m!1102635))

(declare-fun m!1102637 () Bool)

(assert (=> b!1195667 m!1102637))

(declare-fun m!1102639 () Bool)

(assert (=> b!1195673 m!1102639))

(declare-fun m!1102641 () Bool)

(assert (=> b!1195672 m!1102641))

(declare-fun m!1102643 () Bool)

(assert (=> b!1195665 m!1102643))

(declare-fun m!1102645 () Bool)

(assert (=> start!100246 m!1102645))

(declare-fun m!1102647 () Bool)

(assert (=> start!100246 m!1102647))

(declare-fun m!1102649 () Bool)

(assert (=> b!1195675 m!1102649))

(declare-fun m!1102651 () Bool)

(assert (=> b!1195675 m!1102651))

(declare-fun m!1102653 () Bool)

(assert (=> b!1195668 m!1102653))

(declare-fun m!1102655 () Bool)

(assert (=> b!1195668 m!1102655))

(check-sat tp_is_empty!30319 (not b!1195673) (not mapNonEmpty!47315) (not b!1195672) (not b!1195675) (not b!1195667) (not b!1195671) (not b!1195668) (not b!1195665) (not start!100246))
(check-sat)
