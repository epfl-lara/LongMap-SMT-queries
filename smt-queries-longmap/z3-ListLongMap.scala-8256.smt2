; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100720 () Bool)

(assert start!100720)

(declare-fun b_free!25807 () Bool)

(declare-fun b_next!25807 () Bool)

(assert (=> start!100720 (= b_free!25807 (not b_next!25807))))

(declare-fun tp!90410 () Bool)

(declare-fun b_and!42503 () Bool)

(assert (=> start!100720 (= tp!90410 b_and!42503)))

(declare-fun b!1201446 () Bool)

(declare-fun res!799410 () Bool)

(declare-fun e!682420 () Bool)

(assert (=> b!1201446 (=> (not res!799410) (not e!682420))))

(declare-datatypes ((array!77833 0))(
  ( (array!77834 (arr!37555 (Array (_ BitVec 32) (_ BitVec 64))) (size!38092 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77833)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45809 0))(
  ( (V!45810 (val!15312 Int)) )
))
(declare-datatypes ((ValueCell!14546 0))(
  ( (ValueCellFull!14546 (v!17946 V!45809)) (EmptyCell!14546) )
))
(declare-datatypes ((array!77835 0))(
  ( (array!77836 (arr!37556 (Array (_ BitVec 32) ValueCell!14546)) (size!38093 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77835)

(assert (=> b!1201446 (= res!799410 (and (= (size!38093 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38092 _keys!1208) (size!38093 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1201447 () Bool)

(declare-fun e!682421 () Bool)

(assert (=> b!1201447 (= e!682421 true)))

(declare-fun zeroValue!944 () V!45809)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45809)

(declare-fun lt!544449 () array!77833)

(declare-datatypes ((tuple2!19618 0))(
  ( (tuple2!19619 (_1!9820 (_ BitVec 64)) (_2!9820 V!45809)) )
))
(declare-datatypes ((List!26435 0))(
  ( (Nil!26432) (Cons!26431 (h!27649 tuple2!19618) (t!39214 List!26435)) )
))
(declare-datatypes ((ListLongMap!17595 0))(
  ( (ListLongMap!17596 (toList!8813 List!26435)) )
))
(declare-fun lt!544450 () ListLongMap!17595)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5280 (array!77833 array!77835 (_ BitVec 32) (_ BitVec 32) V!45809 V!45809 (_ BitVec 32) Int) ListLongMap!17595)

(declare-fun dynLambda!3224 (Int (_ BitVec 64)) V!45809)

(assert (=> b!1201447 (= lt!544450 (getCurrentListMapNoExtraKeys!5280 lt!544449 (array!77836 (store (arr!37556 _values!996) i!673 (ValueCellFull!14546 (dynLambda!3224 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38093 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!544451 () ListLongMap!17595)

(assert (=> b!1201447 (= lt!544451 (getCurrentListMapNoExtraKeys!5280 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1201448 () Bool)

(declare-fun res!799411 () Bool)

(assert (=> b!1201448 (=> (not res!799411) (not e!682420))))

(declare-datatypes ((List!26436 0))(
  ( (Nil!26433) (Cons!26432 (h!27650 (_ BitVec 64)) (t!39215 List!26436)) )
))
(declare-fun arrayNoDuplicates!0 (array!77833 (_ BitVec 32) List!26436) Bool)

(assert (=> b!1201448 (= res!799411 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26433))))

(declare-fun mapNonEmpty!47609 () Bool)

(declare-fun mapRes!47609 () Bool)

(declare-fun tp!90411 () Bool)

(declare-fun e!682423 () Bool)

(assert (=> mapNonEmpty!47609 (= mapRes!47609 (and tp!90411 e!682423))))

(declare-fun mapRest!47609 () (Array (_ BitVec 32) ValueCell!14546))

(declare-fun mapValue!47609 () ValueCell!14546)

(declare-fun mapKey!47609 () (_ BitVec 32))

(assert (=> mapNonEmpty!47609 (= (arr!37556 _values!996) (store mapRest!47609 mapKey!47609 mapValue!47609))))

(declare-fun b!1201449 () Bool)

(declare-fun res!799405 () Bool)

(declare-fun e!682419 () Bool)

(assert (=> b!1201449 (=> (not res!799405) (not e!682419))))

(assert (=> b!1201449 (= res!799405 (arrayNoDuplicates!0 lt!544449 #b00000000000000000000000000000000 Nil!26433))))

(declare-fun b!1201450 () Bool)

(assert (=> b!1201450 (= e!682420 e!682419)))

(declare-fun res!799407 () Bool)

(assert (=> b!1201450 (=> (not res!799407) (not e!682419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77833 (_ BitVec 32)) Bool)

(assert (=> b!1201450 (= res!799407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544449 mask!1564))))

(assert (=> b!1201450 (= lt!544449 (array!77834 (store (arr!37555 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38092 _keys!1208)))))

(declare-fun b!1201451 () Bool)

(assert (=> b!1201451 (= e!682419 (not e!682421))))

(declare-fun res!799408 () Bool)

(assert (=> b!1201451 (=> res!799408 e!682421)))

(assert (=> b!1201451 (= res!799408 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1201451 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39755 0))(
  ( (Unit!39756) )
))
(declare-fun lt!544448 () Unit!39755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77833 (_ BitVec 64) (_ BitVec 32)) Unit!39755)

(assert (=> b!1201451 (= lt!544448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1201452 () Bool)

(declare-fun res!799402 () Bool)

(assert (=> b!1201452 (=> (not res!799402) (not e!682420))))

(assert (=> b!1201452 (= res!799402 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38092 _keys!1208))))))

(declare-fun b!1201453 () Bool)

(declare-fun res!799409 () Bool)

(assert (=> b!1201453 (=> (not res!799409) (not e!682420))))

(assert (=> b!1201453 (= res!799409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1201454 () Bool)

(declare-fun res!799401 () Bool)

(assert (=> b!1201454 (=> (not res!799401) (not e!682420))))

(assert (=> b!1201454 (= res!799401 (= (select (arr!37555 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47609 () Bool)

(assert (=> mapIsEmpty!47609 mapRes!47609))

(declare-fun res!799403 () Bool)

(assert (=> start!100720 (=> (not res!799403) (not e!682420))))

(assert (=> start!100720 (= res!799403 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38092 _keys!1208))))))

(assert (=> start!100720 e!682420))

(declare-fun tp_is_empty!30511 () Bool)

(assert (=> start!100720 tp_is_empty!30511))

(declare-fun array_inv!28686 (array!77833) Bool)

(assert (=> start!100720 (array_inv!28686 _keys!1208)))

(assert (=> start!100720 true))

(assert (=> start!100720 tp!90410))

(declare-fun e!682422 () Bool)

(declare-fun array_inv!28687 (array!77835) Bool)

(assert (=> start!100720 (and (array_inv!28687 _values!996) e!682422)))

(declare-fun b!1201445 () Bool)

(declare-fun e!682424 () Bool)

(assert (=> b!1201445 (= e!682422 (and e!682424 mapRes!47609))))

(declare-fun condMapEmpty!47609 () Bool)

(declare-fun mapDefault!47609 () ValueCell!14546)

(assert (=> b!1201445 (= condMapEmpty!47609 (= (arr!37556 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14546)) mapDefault!47609)))))

(declare-fun b!1201455 () Bool)

(declare-fun res!799406 () Bool)

(assert (=> b!1201455 (=> (not res!799406) (not e!682420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1201455 (= res!799406 (validMask!0 mask!1564))))

(declare-fun b!1201456 () Bool)

(assert (=> b!1201456 (= e!682424 tp_is_empty!30511)))

(declare-fun b!1201457 () Bool)

(declare-fun res!799404 () Bool)

(assert (=> b!1201457 (=> (not res!799404) (not e!682420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201457 (= res!799404 (validKeyInArray!0 k0!934))))

(declare-fun b!1201458 () Bool)

(assert (=> b!1201458 (= e!682423 tp_is_empty!30511)))

(assert (= (and start!100720 res!799403) b!1201455))

(assert (= (and b!1201455 res!799406) b!1201446))

(assert (= (and b!1201446 res!799410) b!1201453))

(assert (= (and b!1201453 res!799409) b!1201448))

(assert (= (and b!1201448 res!799411) b!1201452))

(assert (= (and b!1201452 res!799402) b!1201457))

(assert (= (and b!1201457 res!799404) b!1201454))

(assert (= (and b!1201454 res!799401) b!1201450))

(assert (= (and b!1201450 res!799407) b!1201449))

(assert (= (and b!1201449 res!799405) b!1201451))

(assert (= (and b!1201451 (not res!799408)) b!1201447))

(assert (= (and b!1201445 condMapEmpty!47609) mapIsEmpty!47609))

(assert (= (and b!1201445 (not condMapEmpty!47609)) mapNonEmpty!47609))

(get-info :version)

(assert (= (and mapNonEmpty!47609 ((_ is ValueCellFull!14546) mapValue!47609)) b!1201458))

(assert (= (and b!1201445 ((_ is ValueCellFull!14546) mapDefault!47609)) b!1201456))

(assert (= start!100720 b!1201445))

(declare-fun b_lambda!20997 () Bool)

(assert (=> (not b_lambda!20997) (not b!1201447)))

(declare-fun t!39213 () Bool)

(declare-fun tb!10599 () Bool)

(assert (=> (and start!100720 (= defaultEntry!1004 defaultEntry!1004) t!39213) tb!10599))

(declare-fun result!21783 () Bool)

(assert (=> tb!10599 (= result!21783 tp_is_empty!30511)))

(assert (=> b!1201447 t!39213))

(declare-fun b_and!42505 () Bool)

(assert (= b_and!42503 (and (=> t!39213 result!21783) b_and!42505)))

(declare-fun m!1108103 () Bool)

(assert (=> b!1201448 m!1108103))

(declare-fun m!1108105 () Bool)

(assert (=> b!1201447 m!1108105))

(declare-fun m!1108107 () Bool)

(assert (=> b!1201447 m!1108107))

(declare-fun m!1108109 () Bool)

(assert (=> b!1201447 m!1108109))

(declare-fun m!1108111 () Bool)

(assert (=> b!1201447 m!1108111))

(declare-fun m!1108113 () Bool)

(assert (=> b!1201457 m!1108113))

(declare-fun m!1108115 () Bool)

(assert (=> mapNonEmpty!47609 m!1108115))

(declare-fun m!1108117 () Bool)

(assert (=> b!1201450 m!1108117))

(declare-fun m!1108119 () Bool)

(assert (=> b!1201450 m!1108119))

(declare-fun m!1108121 () Bool)

(assert (=> b!1201455 m!1108121))

(declare-fun m!1108123 () Bool)

(assert (=> b!1201451 m!1108123))

(declare-fun m!1108125 () Bool)

(assert (=> b!1201451 m!1108125))

(declare-fun m!1108127 () Bool)

(assert (=> b!1201453 m!1108127))

(declare-fun m!1108129 () Bool)

(assert (=> b!1201454 m!1108129))

(declare-fun m!1108131 () Bool)

(assert (=> b!1201449 m!1108131))

(declare-fun m!1108133 () Bool)

(assert (=> start!100720 m!1108133))

(declare-fun m!1108135 () Bool)

(assert (=> start!100720 m!1108135))

(check-sat b_and!42505 tp_is_empty!30511 (not start!100720) (not mapNonEmpty!47609) (not b!1201450) (not b!1201451) (not b_next!25807) (not b!1201453) (not b!1201448) (not b!1201447) (not b!1201457) (not b!1201455) (not b!1201449) (not b_lambda!20997))
(check-sat b_and!42505 (not b_next!25807))
