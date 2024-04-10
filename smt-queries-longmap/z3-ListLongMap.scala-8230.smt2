; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100290 () Bool)

(assert start!100290)

(declare-fun b!1196529 () Bool)

(declare-fun res!796305 () Bool)

(declare-fun e!679808 () Bool)

(assert (=> b!1196529 (=> (not res!796305) (not e!679808))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196529 (= res!796305 (validMask!0 mask!1564))))

(declare-fun b!1196530 () Bool)

(declare-fun res!796302 () Bool)

(assert (=> b!1196530 (=> (not res!796302) (not e!679808))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196530 (= res!796302 (validKeyInArray!0 k0!934))))

(declare-fun b!1196531 () Bool)

(declare-fun e!679813 () Bool)

(assert (=> b!1196531 (= e!679808 e!679813)))

(declare-fun res!796301 () Bool)

(assert (=> b!1196531 (=> (not res!796301) (not e!679813))))

(declare-datatypes ((array!77493 0))(
  ( (array!77494 (arr!37393 (Array (_ BitVec 32) (_ BitVec 64))) (size!37929 (_ BitVec 32))) )
))
(declare-fun lt!543095 () array!77493)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77493 (_ BitVec 32)) Bool)

(assert (=> b!1196531 (= res!796301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543095 mask!1564))))

(declare-fun _keys!1208 () array!77493)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196531 (= lt!543095 (array!77494 (store (arr!37393 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37929 _keys!1208)))))

(declare-fun b!1196532 () Bool)

(declare-fun e!679811 () Bool)

(declare-fun tp_is_empty!30357 () Bool)

(assert (=> b!1196532 (= e!679811 tp_is_empty!30357)))

(declare-fun b!1196533 () Bool)

(declare-fun e!679812 () Bool)

(assert (=> b!1196533 (= e!679812 tp_is_empty!30357)))

(declare-fun b!1196534 () Bool)

(declare-fun res!796303 () Bool)

(assert (=> b!1196534 (=> (not res!796303) (not e!679808))))

(assert (=> b!1196534 (= res!796303 (= (select (arr!37393 _keys!1208) i!673) k0!934))))

(declare-fun b!1196535 () Bool)

(declare-fun res!796299 () Bool)

(assert (=> b!1196535 (=> (not res!796299) (not e!679808))))

(assert (=> b!1196535 (= res!796299 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37929 _keys!1208))))))

(declare-fun b!1196536 () Bool)

(declare-fun res!796306 () Bool)

(assert (=> b!1196536 (=> (not res!796306) (not e!679813))))

(declare-datatypes ((List!26305 0))(
  ( (Nil!26302) (Cons!26301 (h!27510 (_ BitVec 64)) (t!38976 List!26305)) )
))
(declare-fun arrayNoDuplicates!0 (array!77493 (_ BitVec 32) List!26305) Bool)

(assert (=> b!1196536 (= res!796306 (arrayNoDuplicates!0 lt!543095 #b00000000000000000000000000000000 Nil!26302))))

(declare-fun b!1196537 () Bool)

(declare-fun res!796300 () Bool)

(assert (=> b!1196537 (=> (not res!796300) (not e!679808))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45603 0))(
  ( (V!45604 (val!15235 Int)) )
))
(declare-datatypes ((ValueCell!14469 0))(
  ( (ValueCellFull!14469 (v!17873 V!45603)) (EmptyCell!14469) )
))
(declare-datatypes ((array!77495 0))(
  ( (array!77496 (arr!37394 (Array (_ BitVec 32) ValueCell!14469)) (size!37930 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77495)

(assert (=> b!1196537 (= res!796300 (and (= (size!37930 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37929 _keys!1208) (size!37930 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!796298 () Bool)

(assert (=> start!100290 (=> (not res!796298) (not e!679808))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100290 (= res!796298 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37929 _keys!1208))))))

(assert (=> start!100290 e!679808))

(declare-fun array_inv!28500 (array!77493) Bool)

(assert (=> start!100290 (array_inv!28500 _keys!1208)))

(assert (=> start!100290 true))

(declare-fun e!679810 () Bool)

(declare-fun array_inv!28501 (array!77495) Bool)

(assert (=> start!100290 (and (array_inv!28501 _values!996) e!679810)))

(declare-fun mapIsEmpty!47372 () Bool)

(declare-fun mapRes!47372 () Bool)

(assert (=> mapIsEmpty!47372 mapRes!47372))

(declare-fun b!1196538 () Bool)

(declare-fun res!796297 () Bool)

(assert (=> b!1196538 (=> (not res!796297) (not e!679808))))

(assert (=> b!1196538 (= res!796297 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26302))))

(declare-fun b!1196539 () Bool)

(assert (=> b!1196539 (= e!679813 (not (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37929 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvslt (bvsub (size!37929 _keys!1208) (bvadd #b00000000000000000000000000000001 from!1455)) (bvsub (size!37929 _keys!1208) from!1455)))))))

(declare-fun arrayContainsKey!0 (array!77493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196539 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39676 0))(
  ( (Unit!39677) )
))
(declare-fun lt!543096 () Unit!39676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77493 (_ BitVec 64) (_ BitVec 32)) Unit!39676)

(assert (=> b!1196539 (= lt!543096 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!47372 () Bool)

(declare-fun tp!89982 () Bool)

(assert (=> mapNonEmpty!47372 (= mapRes!47372 (and tp!89982 e!679812))))

(declare-fun mapRest!47372 () (Array (_ BitVec 32) ValueCell!14469))

(declare-fun mapKey!47372 () (_ BitVec 32))

(declare-fun mapValue!47372 () ValueCell!14469)

(assert (=> mapNonEmpty!47372 (= (arr!37394 _values!996) (store mapRest!47372 mapKey!47372 mapValue!47372))))

(declare-fun b!1196540 () Bool)

(assert (=> b!1196540 (= e!679810 (and e!679811 mapRes!47372))))

(declare-fun condMapEmpty!47372 () Bool)

(declare-fun mapDefault!47372 () ValueCell!14469)

(assert (=> b!1196540 (= condMapEmpty!47372 (= (arr!37394 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14469)) mapDefault!47372)))))

(declare-fun b!1196541 () Bool)

(declare-fun res!796304 () Bool)

(assert (=> b!1196541 (=> (not res!796304) (not e!679808))))

(assert (=> b!1196541 (= res!796304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!100290 res!796298) b!1196529))

(assert (= (and b!1196529 res!796305) b!1196537))

(assert (= (and b!1196537 res!796300) b!1196541))

(assert (= (and b!1196541 res!796304) b!1196538))

(assert (= (and b!1196538 res!796297) b!1196535))

(assert (= (and b!1196535 res!796299) b!1196530))

(assert (= (and b!1196530 res!796302) b!1196534))

(assert (= (and b!1196534 res!796303) b!1196531))

(assert (= (and b!1196531 res!796301) b!1196536))

(assert (= (and b!1196536 res!796306) b!1196539))

(assert (= (and b!1196540 condMapEmpty!47372) mapIsEmpty!47372))

(assert (= (and b!1196540 (not condMapEmpty!47372)) mapNonEmpty!47372))

(get-info :version)

(assert (= (and mapNonEmpty!47372 ((_ is ValueCellFull!14469) mapValue!47372)) b!1196533))

(assert (= (and b!1196540 ((_ is ValueCellFull!14469) mapDefault!47372)) b!1196532))

(assert (= start!100290 b!1196540))

(declare-fun m!1103735 () Bool)

(assert (=> b!1196538 m!1103735))

(declare-fun m!1103737 () Bool)

(assert (=> b!1196536 m!1103737))

(declare-fun m!1103739 () Bool)

(assert (=> mapNonEmpty!47372 m!1103739))

(declare-fun m!1103741 () Bool)

(assert (=> b!1196539 m!1103741))

(declare-fun m!1103743 () Bool)

(assert (=> b!1196539 m!1103743))

(declare-fun m!1103745 () Bool)

(assert (=> start!100290 m!1103745))

(declare-fun m!1103747 () Bool)

(assert (=> start!100290 m!1103747))

(declare-fun m!1103749 () Bool)

(assert (=> b!1196529 m!1103749))

(declare-fun m!1103751 () Bool)

(assert (=> b!1196534 m!1103751))

(declare-fun m!1103753 () Bool)

(assert (=> b!1196530 m!1103753))

(declare-fun m!1103755 () Bool)

(assert (=> b!1196531 m!1103755))

(declare-fun m!1103757 () Bool)

(assert (=> b!1196531 m!1103757))

(declare-fun m!1103759 () Bool)

(assert (=> b!1196541 m!1103759))

(check-sat (not b!1196539) tp_is_empty!30357 (not b!1196538) (not start!100290) (not b!1196536) (not b!1196530) (not b!1196541) (not b!1196531) (not mapNonEmpty!47372) (not b!1196529))
(check-sat)
