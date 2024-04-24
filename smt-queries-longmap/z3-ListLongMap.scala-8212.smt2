; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100374 () Bool)

(assert start!100374)

(declare-fun b!1195527 () Bool)

(declare-fun res!795081 () Bool)

(declare-fun e!679541 () Bool)

(assert (=> b!1195527 (=> (not res!795081) (not e!679541))))

(declare-datatypes ((array!77313 0))(
  ( (array!77314 (arr!37300 (Array (_ BitVec 32) (_ BitVec 64))) (size!37837 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77313)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1195527 (= res!795081 (= (select (arr!37300 _keys!1208) i!673) k0!934))))

(declare-fun b!1195528 () Bool)

(declare-fun res!795084 () Bool)

(assert (=> b!1195528 (=> (not res!795084) (not e!679541))))

(assert (=> b!1195528 (= res!795084 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37837 _keys!1208))))))

(declare-fun b!1195529 () Bool)

(declare-fun e!679540 () Bool)

(assert (=> b!1195529 (= e!679541 e!679540)))

(declare-fun res!795087 () Bool)

(assert (=> b!1195529 (=> (not res!795087) (not e!679540))))

(declare-fun lt!543229 () array!77313)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77313 (_ BitVec 32)) Bool)

(assert (=> b!1195529 (= res!795087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543229 mask!1564))))

(assert (=> b!1195529 (= lt!543229 (array!77314 (store (arr!37300 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37837 _keys!1208)))))

(declare-fun mapIsEmpty!47198 () Bool)

(declare-fun mapRes!47198 () Bool)

(assert (=> mapIsEmpty!47198 mapRes!47198))

(declare-fun b!1195530 () Bool)

(declare-fun res!795089 () Bool)

(assert (=> b!1195530 (=> (not res!795089) (not e!679541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195530 (= res!795089 (validKeyInArray!0 k0!934))))

(declare-fun res!795088 () Bool)

(assert (=> start!100374 (=> (not res!795088) (not e!679541))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100374 (= res!795088 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37837 _keys!1208))))))

(assert (=> start!100374 e!679541))

(declare-fun array_inv!28504 (array!77313) Bool)

(assert (=> start!100374 (array_inv!28504 _keys!1208)))

(assert (=> start!100374 true))

(declare-datatypes ((V!45457 0))(
  ( (V!45458 (val!15180 Int)) )
))
(declare-datatypes ((ValueCell!14414 0))(
  ( (ValueCellFull!14414 (v!17814 V!45457)) (EmptyCell!14414) )
))
(declare-datatypes ((array!77315 0))(
  ( (array!77316 (arr!37301 (Array (_ BitVec 32) ValueCell!14414)) (size!37838 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77315)

(declare-fun e!679539 () Bool)

(declare-fun array_inv!28505 (array!77315) Bool)

(assert (=> start!100374 (and (array_inv!28505 _values!996) e!679539)))

(declare-fun b!1195531 () Bool)

(declare-fun res!795085 () Bool)

(assert (=> b!1195531 (=> (not res!795085) (not e!679541))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195531 (= res!795085 (and (= (size!37838 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37837 _keys!1208) (size!37838 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195532 () Bool)

(declare-fun e!679536 () Bool)

(assert (=> b!1195532 (= e!679539 (and e!679536 mapRes!47198))))

(declare-fun condMapEmpty!47198 () Bool)

(declare-fun mapDefault!47198 () ValueCell!14414)

(assert (=> b!1195532 (= condMapEmpty!47198 (= (arr!37301 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14414)) mapDefault!47198)))))

(declare-fun b!1195533 () Bool)

(assert (=> b!1195533 (= e!679540 false)))

(declare-fun lt!543228 () Bool)

(declare-datatypes ((List!26289 0))(
  ( (Nil!26286) (Cons!26285 (h!27503 (_ BitVec 64)) (t!38952 List!26289)) )
))
(declare-fun arrayNoDuplicates!0 (array!77313 (_ BitVec 32) List!26289) Bool)

(assert (=> b!1195533 (= lt!543228 (arrayNoDuplicates!0 lt!543229 #b00000000000000000000000000000000 Nil!26286))))

(declare-fun b!1195534 () Bool)

(declare-fun tp_is_empty!30247 () Bool)

(assert (=> b!1195534 (= e!679536 tp_is_empty!30247)))

(declare-fun b!1195535 () Bool)

(declare-fun res!795082 () Bool)

(assert (=> b!1195535 (=> (not res!795082) (not e!679541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195535 (= res!795082 (validMask!0 mask!1564))))

(declare-fun b!1195536 () Bool)

(declare-fun e!679537 () Bool)

(assert (=> b!1195536 (= e!679537 tp_is_empty!30247)))

(declare-fun b!1195537 () Bool)

(declare-fun res!795083 () Bool)

(assert (=> b!1195537 (=> (not res!795083) (not e!679541))))

(assert (=> b!1195537 (= res!795083 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26286))))

(declare-fun b!1195538 () Bool)

(declare-fun res!795086 () Bool)

(assert (=> b!1195538 (=> (not res!795086) (not e!679541))))

(assert (=> b!1195538 (= res!795086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47198 () Bool)

(declare-fun tp!89808 () Bool)

(assert (=> mapNonEmpty!47198 (= mapRes!47198 (and tp!89808 e!679537))))

(declare-fun mapValue!47198 () ValueCell!14414)

(declare-fun mapKey!47198 () (_ BitVec 32))

(declare-fun mapRest!47198 () (Array (_ BitVec 32) ValueCell!14414))

(assert (=> mapNonEmpty!47198 (= (arr!37301 _values!996) (store mapRest!47198 mapKey!47198 mapValue!47198))))

(assert (= (and start!100374 res!795088) b!1195535))

(assert (= (and b!1195535 res!795082) b!1195531))

(assert (= (and b!1195531 res!795085) b!1195538))

(assert (= (and b!1195538 res!795086) b!1195537))

(assert (= (and b!1195537 res!795083) b!1195528))

(assert (= (and b!1195528 res!795084) b!1195530))

(assert (= (and b!1195530 res!795089) b!1195527))

(assert (= (and b!1195527 res!795081) b!1195529))

(assert (= (and b!1195529 res!795087) b!1195533))

(assert (= (and b!1195532 condMapEmpty!47198) mapIsEmpty!47198))

(assert (= (and b!1195532 (not condMapEmpty!47198)) mapNonEmpty!47198))

(get-info :version)

(assert (= (and mapNonEmpty!47198 ((_ is ValueCellFull!14414) mapValue!47198)) b!1195536))

(assert (= (and b!1195532 ((_ is ValueCellFull!14414) mapDefault!47198)) b!1195534))

(assert (= start!100374 b!1195532))

(declare-fun m!1103799 () Bool)

(assert (=> b!1195529 m!1103799))

(declare-fun m!1103801 () Bool)

(assert (=> b!1195529 m!1103801))

(declare-fun m!1103803 () Bool)

(assert (=> mapNonEmpty!47198 m!1103803))

(declare-fun m!1103805 () Bool)

(assert (=> b!1195535 m!1103805))

(declare-fun m!1103807 () Bool)

(assert (=> b!1195537 m!1103807))

(declare-fun m!1103809 () Bool)

(assert (=> b!1195527 m!1103809))

(declare-fun m!1103811 () Bool)

(assert (=> b!1195533 m!1103811))

(declare-fun m!1103813 () Bool)

(assert (=> start!100374 m!1103813))

(declare-fun m!1103815 () Bool)

(assert (=> start!100374 m!1103815))

(declare-fun m!1103817 () Bool)

(assert (=> b!1195538 m!1103817))

(declare-fun m!1103819 () Bool)

(assert (=> b!1195530 m!1103819))

(check-sat (not b!1195529) (not mapNonEmpty!47198) (not b!1195535) (not b!1195530) tp_is_empty!30247 (not start!100374) (not b!1195537) (not b!1195538) (not b!1195533))
(check-sat)
